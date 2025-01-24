# Maintainer: Jan64X <jan.petrlik@protonmail.com>

# Thanks to Davide Depau for his fork of libprintd which this is based on!

pkgname=libfprint-elanmoc2-working-0c90-git
_pkgname=libfprint
pkgver=1.94.0+276+g3d489eb
pkgrel=1
pkgdesc="Library for fingerprint readers with patches for the support of the ELAN 0C90."
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd libgudev)
makedepends=(git meson gtk-doc gobject-introspection glib2 glib2-devel)
checkdepends=(cairo)
conflicts=(libfprint)
provides=(libfprint=1.94.0 libfprint-2.so)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/Depau/libfprint.git#branch=elanmoc2-working")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Edit source file to change the fingerprint reader ID
  sed -i 's/0x0c00/0x0c90/' libfprint/drivers/elanmoc2/elanmoc2.h
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
