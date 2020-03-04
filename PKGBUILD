# Maintainer: Simon Gardling <titaniumtown@gmail.com>

pkgname=sysprof-dev
_pkgname=sysprof
pkgver=3.35.92
pkgrel=1
pkgdesc="Kernel based performance profiler"
url="https://wiki.gnome.org/Apps/Sysprof"
license=(GPL)
arch=(x86_64)
depends=(gtk3 polkit libdazzle)
makedepends=(yelp-tools git meson)
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/sysprof.git")
sha256sums=('SKIP')
provides=(sysprof)
conflicts=(sysprof)

pkgver() {
  cd $_pkgname
  ver=$(git describe --abbrev=0)
  echo ${ver#"sysprof-"}
}

prepare() {
  cd sysprof
}

build() {
  cd $_pkgname
  git checkout tags/sysprof-$pkgver
  cd ..
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
