# Maintainer: Quichsh <quicksh@proton.me>

pkgname=openflipper
pkgver=4.1
pkgrel=1
pkgdesc="OpenFlipper is an OpenSource multi-platform application and programming framework designed for processing, modeling and rendering of geometric data."
arch=('any')
url="https://www.graphics.rwth-aachen.de/software/openflipper/"
license=('BSD')
conflicts=()
depends=("qt5-base")
makedepends=("gcc" "make" "cmake")
optdepends=("qwt")
source=("https://www.graphics.rwth-aachen.de/media/openflipper_static/Releases/${pkgver}/OpenFlipper-${pkgver}.tar.gz" "deprecation.patch" "openflipper.desktop")
md5sums=('a72f9c8ed58ba454ad12488424b538d3'
         'f51a5c25b7d66c47c175d90640fc163c'
         'cc65c5e708f9d3829b43b330713190ef')

prepare() {
    cd "OpenFlipper-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/deprecation.patch"
}

build() {
    cmake -B build -S "OpenFlipper-$pkgver" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    rm -r $pkgdir/usr/include/GL
    install -D -m644 "${srcdir}/openflipper.desktop" "${pkgdir}/usr/share/applications/openflipper.desktop"
    install -D -m644 "OpenFlipper-$pkgver/OpenFlipper/Icons-Source/SVG/openflipper-icon.svg" "${pkgdir}/usr/share/pixmaps/openflipper-icon.svg"
}
