# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: escoand <passtschu at freenet.de>

_basename=faad2
pkgname=lib32-faad2
pkgver=2.11.3
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
sha512sums=('1a468a65b8e738a37b7af5415645e8c45b0c3505fe0794948a6b1f5b17e4f9301c015214584fb534cbfc78f016bfe907a1c88131ab76b728ef1554e4dc7e4551')
b2sums=('da9f96c30653e5bfa41eb0c01b04128cb1a070d8fd46ac0a297cbfddef9d0f895f8f26e525521d7093949dc4f96b66b401d39b318192cfc3127c48e1f307e202')

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
