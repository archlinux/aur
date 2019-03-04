# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=checkmate
pkgver=2.0.24
pkgrel=1
pkgdesc="A program to compare theoretical models against many recent experimental analyses"
url="http://checkmate.hepforge.org/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=("delphes"
         "fastjet"
         "hepmc"
         "madgraph"
         "pythia8"
         "python2-scipy"
         "root")
source=("http://www.hepforge.org/archive/checkmate/CheckMATE-${pkgver}.tar.gz"
        "ExRootAnalysis.patch"
        "fastjet.patch"
        "path.patch"
        "PythiaHandler.patch")
sha256sums=('e72bdccd3151d9b0f2cec47fa638f3c41818b001dcf2811e03d981ab74ede14a'
            '2df72c368af15e82f4998c1e63bdb870b42070f309b503582e9daa713664aef3'
            'f4f335940d436e57195c9a6954414f999cb39fe5f9887c4adf72b24d0a74da45'
            '1c90e1d8a5bf1de25d4eddfa8b6ce7faa0615af4c2ad69b92efbd3b148e2e1af'
            '669df4be408ce98ac3b5ddf9e1a2246e3c4e9a8f57b4a082007fa45348141d2a')

prepare() {
    msg2 "Patching files"
    cd "${srcdir}/CheckMATE-${pkgver}"
    patch -p 1 < "${srcdir}/ExRootAnalysis.patch"
    patch -p 1 < "${srcdir}/fastjet.patch"
    patch -p 1 < "${srcdir}/path.patch"
    patch -p 1 < "${srcdir}/PythiaHandler.patch"

    msg2 "Removing VCS directories"
    find . -type d -name ".svn" | xargs rm -rf
}

build() {
    msg2 "Compiling source"
    cd "${srcdir}/CheckMATE-${pkgver}"
    export CXXFLAGS="$CXXFLAGS -std=c++17"
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
