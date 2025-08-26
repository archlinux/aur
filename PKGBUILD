# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>

_basename=faac
pkgname=lib32-faac
pkgver=1.31.1
pkgrel=1
pkgdesc="Freeware Advanced Audio Coder"
arch=(x86_64)
url="https://www.audiocoding.com/"
_url="https://github.com/knik0/faac"
license=(
    GPL-2.0-or-later
    GPL-3.0-or-later
    LGPL-2.1-or-later
    LicenseRef-ISO-MPEG-4
)
depends=(lib32-glibc faac)
makedepends=(git)
source=(
    $_basename::git+$_url#tag=$_basename-$pkgver
)
sha512sums=('302ab4626b71618deea01da52af4ec32d4842f3c21bfa43c4d2ac6cd3a204fa967bb093d6e0f5bd83d89184cffccd6cbdcbc4dd4ce40302d867177a724ff8f52')
b2sums=('10d23df89aaaf8d361a04744edff02f982d7da983003c32bc2e5ed9b35d740195e12b1f2d80697c3dace13e6022c1d0a4c3e1cd97d5f24eaa3c962e9576cc72c')

prepare() {
    sed -n '9,37p' $_basename/README > LicenseRef-ISO-MPEG-4.txt

    cd $_basename

    autoreconf -vfi
}

build() {
    cd $_basename

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    rm -rf "$pkgdir"/usr/{bin,include,share}

    install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
