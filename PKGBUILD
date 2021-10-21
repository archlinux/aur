# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev at orum.in>

_basename=libraqm
pkgname=lib32-libraqm
pkgver=0.7.2
pkgrel=1
pkgdesc='A library that encapsulates the logic for complex text layout (32-bit)'
arch=(x86_64)
url='https://github.com/HOST-Oman/libraqm/'
license=(MIT)
depends=(lib32-freetype2 lib32-fribidi libraqm)
makedepends=(meson)
source=(https://github.com/HOST-Oman/libraqm/releases/download/v$pkgver/raqm-$pkgver.tar.xz
        https://github.com/HOST-Oman/libraqm/commit/819a3e9c.patch)
sha256sums=('92e765f180033ef3750832eb6fee4e07de3f99bd3d1eae7cf7e4e390ed2ae8eb'
            '320a26e63954e760c526b7bb5e2f9526cb76cdd7be2d3ad3e3883b32634e3c99')

prepare() {
    patch -d raqm-$pkgver -p1 < 819a3e9c.patch # Fix meson library version
}

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    meson build raqm-$pkgver \
        --prefix=/usr \
        --libdir=lib32
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    rm -rf "$pkgdir/usr/include"

    install -D -m644 raqm-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
