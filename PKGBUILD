# Maintainer: someoneelse <lllusion3418@gmail.com>

pkgname=fstl
pkgver=0.9.3
pkgrel=1
pkgdesc="A viewer for .stl files"
url="http://www.mattkeeter.com/projects/fstl/"
arch=('any')
license=('MIT')
depends=('qt5-base')
makedepends=("icoutils")
source=("https://github.com/mkeeter/fstl/archive/v${pkgver}.tar.gz"
        "fstl.desktop")
sha256sums=('a366861683eda9510b36b7c06068d9c314bef21b1f6aa43c5069e096347fbce2'
            '1b41e3cd75765738c7519b03579af00895bb4bff77370d3e774185aefba55996')

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
