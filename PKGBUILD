# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph
pkgver=2.4.0
_dirname="MG5_aMC_v${pkgver//./_}"
pkgrel=20160513
pkgdesc="MadGraph5_aMC@NLO is a framework that aims at providing all the elements necessary for SM and BSM phenomenology"
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python2' 'bash' 'perl' 'tcsh' 'gcc-fortran')
source=("http://madgraph.hep.uiuc.edu/Downloads/MG5_aMC_v${pkgver}.tar.gz")
sha256sums=('9571bcdefb4a15546db1d403f6d2818fc4d21033558ca2a7d376cc71d197aa66')
options=("!strip")

prepare() {
    echo "################################################################################"
    echo "Patching python -> python2"
    cd ${srcdir}/${_dirname}
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*/usr/bin/env\s\+python\s*$|#!/usr/bin/env python2|'
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*/usr/bin/python\s*$|#!/usr/bin/env python2|'
    echo "################################################################################"
    echo "Building CutTools"
    cd ${srcdir}/${_dirname}/vendor/CutTools
    make -j1
    make clean
    echo "################################################################################"
    # DisceteSampler doesn't compile (if someone needs this, I welcome a patch)
    # echo ""
    # echo "################################################################################"
    # echo "Building DiscreteSampler"
    # cd ${srcdir}/${_dirname}/vendor/DiscreteSampler
    # make
    # make clean
    # echo "################################################################################"
    echo ""
    echo "################################################################################"
    echo "Building IREGI"
    cd ${srcdir}/${_dirname}/vendor/IREGI/src
    make
    make clean
    echo "################################################################################"
    echo ""
    echo "################################################################################"
    echo "Building SMWidth"
    cd ${srcdir}/${_dirname}/vendor/SMWidth
    make
    make clean
    echo "################################################################################"
    echo ""
    echo "################################################################################"
    echo "Building StdHEP"
    cd ${srcdir}/${_dirname}/vendor/StdHEP
    make
    make clean
    echo "################################################################################"
    echo ""
    echo "################################################################################"
    echo "Building Ninja"
    cd ${srcdir}/${_dirname}/vendor/
    tar xf ninja.tar.gz
    rm ninja.tar.gz
    cd ninja-1.1.0
    ./configure
    make
    make clean
    echo "################################################################################"
    echo ""
    echo "################################################################################"
    echo "Building OneLoop"
    cd ${srcdir}/${_dirname}/vendor/
    tar xf oneloop.tar.gz
    rm oneloop.tar.gz
    cd OneLOop-3.6
    ./create.py
    ./clean.sh
    echo "################################################################################"
    echo ""
    echo "################################################################################"
    echo "Extracting documentation"
    cd ${srcdir}/${_dirname}
    tar xf doc.tgz
    rm doc.tgz

    echo "Patching python -> python2"
    cd ${srcdir}/${_dirname}
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*/usr/bin/env\s\+python\s*$|#!/usr/bin/env python2|'
    find . -type f -print0 | xargs -0 sed -i 's|^#!\s*/usr/bin/python\s*$|#!/usr/bin/env python2|'

    echo "Patching root_path"
    cd ${srcdir}/${_dirname}
    find . -type f -print0 | xargs -0 sed -i 's|^\(\s*\)root_path\s*=.*$|\1root_path = "/usr/share/madgraph"|'

    echo "Removing CVS directories"
    cd ${srcdir}/${_dirname}
    find . -type d -name "CVS" | xargs rm -rf
    find . -type f -name ".bzrignore" | xargs rm -f
    find . -type f -name ".bzr" | xargs rm -rf
    echo "################################################################################"

}

package() {
    install -Dm755 "${srcdir}/${_dirname}/bin/mg5" "${pkgdir}/usr/bin/mg5"
    install -Dm755 "${srcdir}/${_dirname}/bin/mg5_aMC" "${pkgdir}/usr/bin/mg5_aMC"
    install -Dm755 "${srcdir}/${_dirname}/aloha/bin/aloha" "${pkgdir}/usr/bin/aloha"
    install -Dm755 "${srcdir}/${_dirname}/MadSpin/madspin" "${pkgdir}/usr/bin/madspin"

    install -Dm655 "${srcdir}/${_dirname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -a "${srcdir}/${_dirname}/." "${pkgdir}/usr/share/${pkgname}"
    rm -r "${pkgdir}/usr/share/${pkgname}/bin"
    rm -r "${pkgdir}/usr/share/${pkgname}/aloha/bin"
    rm "${pkgdir}/usr/share/${pkgname}/MadSpin/madspin"

    find "${pkgdir}/usr/share/${pkgname}" -type f -print0 | xargs -0 chmod 644
    find "${pkgdir}/usr/share/${pkgname}" -type f -path "*/bin/*" -print0 | xargs -0 chmod 755

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
