# Maintainer: Azarattum <azarattum@pm.me>
pkgname=hotkeyer-git
_pkgname=hotkeyer
pkgver=2.1.4
pkgrel=1
pkgdesc='Universal context-aware hotkeyer. (fork of keymapper)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Azarattum/UniversalHotkeyer"
license=('GPL3')
depends=('libusb' 'libx11')
makedepends=('cmake' 'git')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=('git+https://github.com/Azarattum/UniversalHotkeyer'
        'hotkeyer.service'
        'hotkeyer.desktop')
md5sums=(SKIP
         SKIP
         SKIP)

pkgver() {
  cd "${srcdir}/UniversalHotkeyer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/UniversalHotkeyer"
  echo "\"${pkgver}\"" > "src/_version.h"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  install -Dm644 "hotkeyer.service" -t "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "hotkeyer.desktop" -t "$pkgdir/etc/xdg/autostart/"

  cd "${srcdir}/UniversalHotkeyer"
  make DESTDIR="$pkgdir" install
}
