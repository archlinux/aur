# This PKGBUILD is hereby dedicated to the public domain.
# Maintainer: Carson Black <uhhadd AT gmail DOT com>
pkgname=ikona
pkgver=1.0
pkgrel=1
pkgdesc="Icon preview designed for Plasma"
arch=(any)

url="https://invent.kde.org/KDE/ikona"
license=("GPL")

depends=(
    "kirigami2" "plasma-framework" "qt5-base" "qt5-quickcontrols2" "qt5-declarative"
    "qt5-webengine" "ki18n"
)
makedepends=(
    "cmake" "extra-cmake-modules" "rust" "patchelf"
)

source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig}
        "https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.cargo.vendor.tar.xz"{,.sig})
noextract=("$pkgname-$pkgver.cargo.vendor.tar.xz")
md5sums=("a971ea585b6c506e1d31099778e9beac"
         "SKIP"
         "c08391d5f14d314dc06a0c8cb2408f2e"
         "SKIP")
validpgpkeys=("072508A8631C101D1049EE3C6872C7CED8B46ABE") # Carson Black <uhhadd@gmail.com>

ikona_sourcedir=""

prepare() {
    ikona_sourcedir="$PWD"
    cp "$ikona_sourcedir/$pkgname-$pkgver.cargo.vendor.tar.xz" "ikona-1.0/$pkgname.cargo.vendor.tar.xz"
    cd "$pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
    patchelf --remove-rpath "$pkgdir/usr/bin/ikona-cli"
    patchelf --remove-rpath "$pkgdir/usr/lib/libikonars.so"
}
