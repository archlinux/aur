# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: Lorenzo Ferrillo <lorenzofer@live.it>
# Contributor: Ray Rashif <schiv@archlinux.org>

_basename=lv2
pkgname=lib32-lv2
pkgver=1.18.6
pkgrel=1
pkgdesc="Plugin standard for audio systems (32-bit)"
url="http://lv2plug.in/"
license=('LGPL' 'custom')
arch=('x86_64')
depends=(lib32-gcc-libs lib32-libsndfile lv2)
makedepends=(codespell flake8 meson python-black python-pylint python-rdflib serd sord)
source=(https://lv2plug.in/spec/$_basename-$pkgver.tar.xz{,.sig})
sha512sums=('baecef70abe8354bca056d67085657e2174e39d2030a5173a226ee194c96662d6c3351df4500b4631e08798765dfed6d758b6be16a2ea78c4f29abb53c5d786f'
            'SKIP')
b2sums=('27c9eb3e15e4515a63f93552c8924c502f8bc585fbf62a62a1fca4ff7fd2e9940827cda4b5c7cbb6858324e1dba5bcad2ad75239da9f860db56e6839224ae186'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename-$pkgver build \
        --libdir='/usr/lib32' \
        -Ddocs=disabled

    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -vDm 644 $_basename-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 $_basename-$pkgver/{NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

    cd "$pkgdir/usr"

    rm -r bin include share/lv2specgen
}
