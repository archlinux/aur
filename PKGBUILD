# Maintainer: houmain <houmain@posteo.net>
pkgname=keymapper-git
_pkgname=keymapper
pkgver=latest
pkgrel=1
pkgdesc='A cross-platform context-aware key remapper.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/houmain/keymapper"
license=('GPL3')
depends=('libusb' 'libudev' 'libx11')
makedepends=('cmake' 'git')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=('git+https://github.com/houmain/keymapper.git'
        'keymapperd.service'
        'keymapper.desktop')
md5sums=(SKIP
         SKIP
         SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  echo "\"${pkgver}\"" > "src/_version.h"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  install -Dm644 "keymapperd.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "keymapper.desktop" -t "$pkgdir/etc/xdg/autostart/"

  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}
