# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=sysprof-dev
pkgver=3.35.3
pkgrel=1
pkgdesc="Kernel based performance profiler"
url="https://wiki.gnome.org/Apps/Sysprof"
license=(GPL)
arch=(x86_64)
depends=(gtk3 polkit libdazzle)
makedepends=(yelp-tools git meson)
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/sysprof.git#tag=sysprof-$pkgver")
sha256sums=('SKIP')
provides=(sysprof)

pkgver() {
  cd sysprof
  git describe --tags | sed 's/^sysprof-//;s/-/+/g'
}

prepare() {
  cd sysprof
}

build() {
  CFLAGS+=" -ffat-lto-objects"

  arch-meson sysprof build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
