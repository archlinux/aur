# Maintainer: houmain <houmain at posteo dot net>

pkgname=keymapper-git
_pkgname=keymapper
pkgver=latest
pkgrel=5
pkgdesc="A cross-platform context-aware keyremapper"
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://github.com/houmain/keymapper
license=(GPL3)
depends=(gcc-libs libxkbcommon libusb libx11 dbus wayland libappindicator-gtk3)
makedepends=(cmake git)
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(git+https://github.com/houmain/keymapper.git)
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # use full path for execstart
  sed -i 's|^ExecStart=keymapperd|ExecStart=/usr/bin/keymapperd|' \
    extra/lib/systemd/system/keymapperd.service
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake . -DVERSION="$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
