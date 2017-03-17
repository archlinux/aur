# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=madgraph
pkgver=2.5.3
_dirname="MG5_aMC_v${pkgver//./_}"
pkgrel=1
pkgdesc="MadGraph5_aMC@NLO is a framework that aims at providing all the elements necessary for SM and BSM phenomenology"
url="http://madgraph.hep.uiuc.edu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=(
    'bash'
    'gcc-fortran'
    'perl'
    'python2'
    'tcsh'
)
optdepends=(
    'delphes'
    'fastjet'
    'golem95'
    'hepmc'
    'lhapdf'
    'madanalysis5'
    'madgraph-pythia-pgs'
    'madgraph-pythia8-interface'
)
source=("https://launchpad.net/mg5amcnlo/${pkgver%%.*}.0/${pkgver%.*}.x/+download/MG5_aMC_v${pkgver}.tar.gz"
        "python2.patch"
        "mg5_configuration.patch")
sha256sums=('8124ce6152fea32082ce76bc8afe6b618d3d022aa35a566864efdd37a81061c8'
            '0b8e1a73b811a15ac2b06d65502f19e7fc64b6a24abd8c2f35474d3443ced2bb'
            '492329cc4158414c0b9e27d9b053afa04fe3afa2436a0c0b7aa014cafda2429f')
options=("!strip")

prepare() {
    msg2 "Fixing python references for python2"
    patch -p 1 < python2.patch

    msg2 "Extracting documentation"
    cd "${srcdir}/${_dirname}"
    tar xf doc.tgz
    rm doc.tgz

    msg2 "Removing VCS directories"
    find "${srcdir}/${_dirname}" -name "CVS" \
         -o -name ".svn" \
         -o -name ".bzr" -o -name ".bzrignore" \
         -o -name ".git" -o -name ".gitignore" \
         -o -name ".hg" -o -name ".hgignore" | xargs rm -rf
}

build() {
    msg2 "Compiling python source files"
    python2 -O -m compileall -qf "${srcdir}/${_dirname}" 2>&1 1>/dev/null || true

    msg2 "Initialize MG5 first run"
    # MadGraph needs to generate `Template/LO/Source/make_opts` which is done
    # automatically at startup.  This needs to be done during setup (or with
    # root access)
    tmpfile=$(mktemp)
    echo "exit" > $tmpfile
    "${srcdir}/${_dirname}/bin/mg5_aMC" $tmpfile 1>/dev/null
    rm $tmpfile

    msg2 "Updating configuration file"
    patch -p 1 < mg5_configuration.patch
}

package() {
    msg2 "Installing files"

    # Copy everything of /opt/madgraph since the program isn't nicely
    # separated into bin, include, etc.
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/${_dirname}/." "${pkgdir}/opt/${pkgname}"
    install -Dm655 "${srcdir}/${_dirname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Create symbolic links in /usr/bin to mg5 and mg5_aMC
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/mg5" "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/bin/mg5_aMC" "${pkgdir}/usr/bin/"

    # For some reason, a lot of files have executable flags.  Change them back
    # to non-executable (except for actual executables)
    find "${pkgdir}/opt/${pkgname}" -type f -print0 | xargs -0 chmod 644
    find "${pkgdir}/opt/${pkgname}" -type f -path "*/bin/*" -print0 | xargs -0 chmod 755
    chmod 755 "${pkgdir}/opt/${pkgname}/MadSpin/madspin"

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
