# Maintainer: JP-Ellis <josh@jpellis.me>

pkgname=checkmate
pkgver=2.0.3
pkgrel=1
pkgdesc="A program to compare theoretical models against many recent experimental analyses"
url="http://checkmate.hepforge.org/"
arch=('i686' 'x86_64')
license=('GPLv3')
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
        "path.patch")
sha256sums=('8e57c813f89299084783798e793e39276113b751751e866d6124706fba36926d'
            '9420c9b166261a67e2febe983c37638dcff85b3660b5fd4acf1733a52b0d9402'
            '55874c4a88f10b0307a1495028acfd7ad28f1fac6b170fcafbe3c01a5a0b0edb'
            '1a32019b873acb0d5f9c9bf83291a4063e252a1ccf2e0d06d6d144d6c21d9697')

prepare() {
    msg2 "Patching files"
    patch -p 1 < ExRootAnalysis.patch
    patch -p 1 < fastjet.patch
    patch -p 1 < path.patch

    msg2 "Removing VCS directories"
    find . -type d -name ".svn" | xargs rm -rf
}

build() {
    cd CheckMATE-${pkgver}
    ./configure --prefix="${pkgdir}/usr/" \
                --with-hepmc=/usr \
                --with-pythia=/usr \
                --with-gzipinc=/usr/include \
                --with-gziplib=/usr/lib \
                --with-python=/usr/bin/python2 \
                --with-rootsys=/usr \
                --with-delphes=/usr \
                --with-madgraph=/usr/share/madgraph
    make

    python2 -O -m compileall -qf . || true
}

package() {
    # CheckMATE does not provide `make install`; so we manually install files
    #
    # If any file is missing, I welcome a patch
    install -Dm755 "${srcdir}/CheckMATE-${pkgver}/bin/CheckMATE" "${pkgdir}/usr/bin/CheckMATE"

    install -d "${pkgdir}/usr/share/CheckMATE"
    cp -r "${srcdir}/CheckMATE-${pkgver}/tools" "${pkgdir}/usr/share/CheckMATE"
    cp -r "${srcdir}/CheckMATE-${pkgver}/data" "${pkgdir}/usr/share/CheckMATE/"
}

# Local Variables:
# mode: sh
# End:
