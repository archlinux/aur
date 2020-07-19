# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=libfprint
pkgname=libfprint-vfs009x-git
epoch=1
pkgver=1.90.1.r0.g82aed23
pkgrel=2
pkgdesc="Library for fingerprint readers (includes libre vfs0090 and vfs0097 driver)"
arch=(i686 x86_64)
url="https://github.com/3v1n0/libfprint"
license=(LGPL)
depends=(libusb nss pixman gnutls openssl gobject-introspection glib2 cairo pixman nss openssl)
makedepends=(git meson gtk-doc pkgconf)
optdepends=(
  "fprintd: D-Bus daemon that manages fingerprint readers"
  "validity-sensors-tools: Flash, factory reset and pair Validity fingerprint sensors 009x"
  "gtk3: (make) Build GTK-based demos"
)
groups=(fprint-git)
provides=(libfprint libfprint-2.so=2-64 libfprint-vfs009x libfprint-vfs0090 libfprint-vfs0097)
conflicts=(libfprint)
replaces=(libfprint libfprint-vfs009x libfprint-vfs0090 libfprint-vfs0097)
source=("git+https://github.com/3v1n0/libfprint.git#branch=vfs0090")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed -e 's/^V_//;s/\([0-9]*-g\)/r\1/;s/[-_]/./g' -e 's/^v//g' -e 's/+vfs009.\..//g'
}

build() {
  cd "$srcdir"
  arch-meson $_pkgname build -D x11-examples=false -D doc=false
  ninja -C build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install
}
