# Maintainer: someoneelse <lllusion3418@gmail.com>

pkgname=fstl
pkgver=0.9.4
pkgrel=1
pkgdesc="A viewer for .stl files"
url="http://www.mattkeeter.com/projects/fstl/"
arch=('any')
license=('MIT')
depends=('qt5-base')
makedepends=("icoutils")
source=("https://github.com/mkeeter/fstl/archive/v${pkgver}.tar.gz"
        "fstl.desktop")
sha256sums=('5c2d6bf14ec0bee15d415a0810787bfd714971822a4fa9433c6ea476484dd335'
            '53d2a7911cacc1ca8e9fe823e8ecf2777c1158f51d2b909ebb106d976c70bec5')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p build
    pushd build
    qmake-qt5 PREFIX="/usr" ../qt/fstl.pro
    make
    popd

    sed -n '/Copyright/,/PROVIDED/p' README.md > LICENSE

    pushd "exe"
    icotool --extract --index=6 --output=../fstl.png fstl.ico
    popd
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    pushd "build"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm755 fstl "${pkgdir}/usr/bin/fstl"
    popd

    install -D -m644 fstl.png "${pkgdir}/usr/share/pixmaps/fstl.png"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m644 "${srcdir}/fstl.desktop" "${pkgdir}/usr/share/applications/fstl.desktop"

}
