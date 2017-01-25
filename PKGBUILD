# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph
pkgver=2.5.2
_dirname="MG5_aMC_v${pkgver//./_}"
pkgrel=1
pkgdesc="MadGraph5_aMC@NLO is a framework that aims at providing all the elements necessary for SM and BSM phenomenology"
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=(
    'python2'
    'bash'
    'perl'
    'tcsh'
    'gcc-fortran'
    'cmake'
)
source=("https://launchpad.net/mg5amcnlo/${pkgver%%.*}.0/${pkgver%.*}.x/+download/MG5_aMC_v${pkgver}.tar.gz")
sha256sums=('7968f6d0543b3af2649ba497d17c3a23b089cc6f5ba352e0fd7fa106aa07a512')
options=("!strip")

prepare() {
    # Some of the build steps below require this patch
    msg2 "Fixing python references for python2"
    cd "${srcdir}/${_dirname}"
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*\(/usr\)\?/bin/env\s\+python\s*$|#!/usr/bin/env python2|'
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*\(/usr\)\?/bin/python\s*$|#!/usr/bin/env python2|'

    msg2 "Building CutTools"
    cd "${srcdir}/${_dirname}/vendor/CutTools"
    # Parallel building not supported by CutTools
    make -j1
    make clean

    # msg2 "Building DiscreteSampler"
    msg2 "Can't build DiscreteSampler (if you need this, I welcome a patch)"
    # cd ${srcdir}/${_dirname}/vendor/DiscreteSampler
    # make
    # make clean

    msg2 "Building IREGI"
    cd "${srcdir}/${_dirname}/vendor/IREGI/src"
    make
    make clean

    msg2 "Building SMWidth"
    cd "${srcdir}/${_dirname}/vendor/SMWidth"
    make
    make clean

    msg2 "Building StdHEP"
    cd "${srcdir}/${_dirname}/vendor/StdHEP"
    make
    make clean

    msg2 "Building Collier"
    cd "${srcdir}/${_dirname}/vendor"
    tar xf collier.tar.gz
    rm collier.tar.gz
    cd COLLIER-1.0/build
    cmake ..
    make
    rm -rf *

    msg2 "Building Ninja"
    cd "${srcdir}/${_dirname}/vendor/"
    tar xf ninja.tar.gz
    rm ninja.tar.gz
    cd ninja-1.1.0
    ./configure
    # Parallel building can cause issues sporadically
    make -j1
    make clean

    msg2 "Building OneLoop"
    cd "${srcdir}/${_dirname}/vendor/"
    tar xf oneloop.tar.gz
    rm oneloop.tar.gz
    cd OneLOop-3.6
    ./create.py
    ./clean.sh

    msg2 "Extracting documentation"
    cd "${srcdir}/${_dirname}"
    tar xf doc.tgz
    rm doc.tgz

    # This needs to be run again as there are new python files
    msg2 "Fixing python references for python2"
    cd "${srcdir}/${_dirname}"
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*\(/usr\)\?/bin/env\s\+python\s*$|#!/usr/bin/env python2|'
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*\(/usr\)\?/bin/python\s*$|#!/usr/bin/env python2|'

    msg2 "Compiling python source files (there might be errors)"
    python2 -O -m compileall -qf "${srcdir}/${_dirname}" || true


    msg2 "Removing VCS directories"
    cd "${srcdir}/${_dirname}"
    find . -name "CVS" \
         -o -name ".svn" \
         -o -name ".bzr" -o -name ".bzrignore" \
         -o -name ".git" -o -name ".gitignore" \
         -o -name ".hg" -o -name ".hgignore" | xargs rm -rf

}

package() {
    msg2 "Initialize MG5 first run"
    # MadGraph needs to generate `Template/LO/Source/make_opts` which is done
    # automatically at startup.  This needs to be done during setup (or with
    # root access)
    tmpfile=$(mktemp)
    echo "exit" > $tmpfile
    "${srcdir}/${_dirname}/bin/mg5_aMC" $tmpfile 1>/dev/null

    msg2 "Patching root_path"
    # This should be converted to a proper patch file in the future
    find "${srcdir}/${_dirname}/bin" -type f -print0 | xargs -0 sed -i 's|^\(\s*\)root_path\s*=.*$|\1root_path = "/usr/share/madgraph"|'

    msg2 "Installing files"

    # Copy everything of /usr/share/madgraph since the program isn't nicely
    # separated into bin, include, etc.
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -a "${srcdir}/${_dirname}/." "${pkgdir}/usr/share/${pkgname}"
    install -Dm655 "${srcdir}/${_dirname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Create symbolic links in /usr/bin to mg5 and mg5_aMC
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/bin/mg5" "${pkgdir}/usr/bin/"
    ln -s "/usr/share/${pkgname}/bin/mg5_aMC" "${pkgdir}/usr/bin/"

    # For some reason, a lot of files have executable flags.  Change them back
    # to non-executable (except for actual executables)
    find "${pkgdir}/usr/share/${pkgname}" -type f -print0 | xargs -0 chmod 644
    find "${pkgdir}/usr/share/${pkgname}" -type f -path "*/bin/*" -print0 | xargs -0 chmod 755
    chmod 755 "${pkgdir}/usr/share/${pkgname}/MadSpin/madspin"

    echo ""
    echo "If you use MadGraph, please cite:"
    echo "-----------------------------------------------------------------"
    echo "Alwall, J., et al. \"The automated computation of tree-level and"
    echo "next-to-leading order differential cross sections, and their"
    echo "matching to parton shower simulations.\" Journal of High Energy"
    echo "Physics 2014.7 (2014): 1-157."
    echo "-----------------------------------------------------------------"
    echo ""
}

# Local Variables:
# mode: sh
# End:
