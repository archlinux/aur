# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: escoand <passtschu at freenet.de>

_basename=faad2
pkgname=lib32-faad2
pkgver=2.11.2
pkgrel=1
pkgdesc="Freeware Advanced Audio (AAC) Decoder"
arch=(x86_64)
url="https://github.com/knik0/faad2"
license=(GPL-2.0-or-later)
depends=(
    lib32-glibc
    faad2
)
makedepends=(cmake)
source=($_basename-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('fd140c0f4e7946e95a49a8652e26f33b138fc3375da34d5e3a55cdde8a74be429eb6fe0180bd434841022cee3c2ec65fe40dda7440fe0dd2761622174f992490')
b2sums=('cf7852e1891af0eb254b6ec068bbe472dd8c2e465fc4104bd1a69d7cbbe2d36439e50ee252b0879e7a77fab9dcd8299056eff7d7855352a50ebe29978421e7f0')

build() {
    local cmake_options=(
        -B build
        -D CMAKE_INSTALL_LIBDIR=lib32
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -S $_basename-$pkgver
        -W no-dev
    )

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    cmake "${cmake_options[@]}"

    cmake --build build --verbose
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    rm -rf "${pkgdir}/usr"/{bin,include,share}

    install -vDm 644 $_basename-$pkgver/{AUTHORS,ChangeLog,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
