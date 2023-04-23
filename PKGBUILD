# Maintainer: tarball <bootctl@gmail.com>

pkgname=bunnymodxt-launcher
pkgver=0.2
pkgrel=1
pkgdesc='GUI launcher for Bunnymod XT'
url='https://github.com/YaLTeR/bxt-launcher'
arch=(x86_64)
license=(GPL3)
depends=(bunnymodxt glib2 glibc gtk3 libgtop)
makedepends=(meson vala)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('0b0ef2f84b2d7bf6dd242fb74dbd377f2c6dfd5bdbde49f00122fb4093fde1fc5a275277e739c0cd7b8975a2111e6c591117209fd71ec5b3b53794559b6f576b')

build() {
  arch-meson bxt-launcher-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # the launcher expects two files to reside in the same directory as the
  # main binary instead of the usual system-wide locations
  install -d "$pkgdir"/usr/lib/$pkgname

  # hide the real launcher away from our sight
  mv "$pkgdir"/usr/bin/bxt-launcher \
    "$pkgdir"/usr/lib/$pkgname/

  ln -s /usr/lib/$pkgname/bxt-launcher \
    "$pkgdir"/usr/bin/

  # place a link to the library alongside the launcher
  ln -s /usr/lib/libBunnymodXT.so \
    "$pkgdir"/usr/lib/$pkgname/

  # do the same with gschemas
  ln -s /usr/share/glib-2.0/schemas/gschemas.compiled \
    "$pkgdir"/usr/lib/$pkgname/
}
