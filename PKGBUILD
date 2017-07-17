# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=checkmate
pkgver=2.0.11
pkgrel=2
pkgdesc="A program to compare theoretical models against many recent experimental analyses"
url="http://checkmate.hepforge.org/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("delphes"
         "fastjet"
         "hepmc"
         "madgraph"
         "pythia"
         "python2-scipy"
         "root")
source=("http://www.hepforge.org/archive/checkmate/CheckMATE-${pkgver}.tar.gz"
        "ExRootAnalysis.patch"
        "fastjet.patch"
        "path.patch"
        "PythiaHandler.patch")
sha256sums=('36a6426841c1ae5c268298b13c6674ddf3f3f6d6cdb4b2463c6d36b580074879'
            '0318bd33ae752a914e1af6102f5c648a4bcb72d87922f30561f7f9e44c80e169'
            'c5be604f8cc3edcfd69c58b3c56c431ff2d8329e8a3ef1afea39ffd1d4f194f5'
            '7069aaf2bfa0ad620e268f106c85f3b32688f78f5f122824ea9b4c665603c7cf'
            'c073ee1e04a415dc3be3aa81de38feb031acec770b98b7b3429707e8cd7f81f1')

prepare() {
    msg2 "Patching files"
    patch -p 1 < ExRootAnalysis.patch
    patch -p 1 < fastjet.patch
    patch -p 1 < path.patch
    patch -p 1 < PythiaHandler.patch

    msg2 "Removing VCS directories"
    find . -type d -name ".svn" | xargs rm -rf
}

build() {
    msg2 "Compiling source"
    cd CheckMATE-${pkgver}
    ./configure --prefix="${pkgdir}/usr/" \
                --with-hepmc=/usr \
                --with-pythia=/usr \
                --with-gzipinc=/usr/include \
                --with-gziplib=/usr/lib \
                --with-python=/usr/bin/python2 \
                --with-rootsys=/usr \
                --with-delphes=/usr \
                --with-madgraph=/opt/madgraph
    make
    make AnalysisManager

    msg2 "Cleaning temporary build files"
    find . -type f -name "*.o" -o -name "*.lo" -print0 | xargs -0 rm -f
    find . -type d -name ".libs" -empty -delete

    msg2 "Compiling Python files"
    python2 -O -m compileall -qf . || true

}

package() {
    msg2 "Copying files"
    mkdir -p "${pkgdir}/opt/checkmate"
    cp -r "${srcdir}/CheckMATE-${pkgver}/." "${pkgdir}/opt/checkmate/"

    msg2 "Linking binaries"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/checkmate/bin/CheckMATE" "${pkgdir}/usr/bin"
    ln -s "/opt/checkmate/bin/AnalysisManager" "${pkgdir}/usr/bin"
}

# Local Variables:
# mode: sh
# End:
