# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>

_basename=faac
pkgname=lib32-faac
pkgver=2.1
pkgrel=1
pkgdesc="Freeware Advanced Audio Coder"
arch=(x86_64)
url="https://github.com/knik0/faac"
license=(LGPL-2.1-or-later)
depends=(lib32-glibc faac)
makedepends=(
    git
    meson
)
source=(
    $_basename::git+$url#tag=$_basename-$pkgver
)
sha512sums=('26feb81ab47e91cb72e4243cfb33c2eee66e6e2b69a8a0cdeb4bb40fc74f6786a4457a57237431bf8935fabe41a34b99bb5914c7f63836c4fa6e446c4833f85e')
b2sums=('6f3eadc53c36f321370bb61514f11c08c3b51b7ca53469bf91943f8900f7fa44f2230d5837bf972cbb881b4102b83b485da9a970384879d10c4146989118aee6')

build() {
    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

    arch-meson $_basename build \
        --libdir='/usr/lib32'

    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -vDm 644 $_basename/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm 644 $_basename/{AUTHORS,ChangeLog,NEWS,README.md,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"

    rm -rf "$pkgdir"/usr/{bin,include,share/man}
}
