# Maintainer: Pablo Arteaga <pablo at pabloarteaga (dot) com>
#
# This is a modified version of the libfprint-git PKGBUILD file on the AUR

pkgname=libfprint-tod-git
_pkgdirname=libfprint
pkgver=1.90.2+tod1
pkgrel=1
pkgdesc="Library for fingerprint readers - TOD version"
arch=(x86_64)
url="https://fprint.freedesktop.org/"
license=(LGPL)
depends=('libgusb>=0.3.0' nss pixman)
makedepends=(git gobject-introspection gtk-doc 'meson>=0.49.0')
checkdepends=(python python-cairo python-gobject 'umockdev>=0.13.2')
optdepends=()
# Provide libfprint for compatibility with fprintd and also provide libfprint-tod for tod-style-only drivers
provides=(libfprint libfprint-tod libfprint-2.so libfprint-2-tod.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/3v1n0/libfprint.git#branch=tod")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgdirname
  git describe --tags | sed 's/^V_\|^v//;s/_/./g;s/-/.r/;s/-/./'
}

build() {
  arch-meson $_pkgdirname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
