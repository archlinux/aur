# Maintainer: Dan <daniel@m8t.io>
pkgname=btd700ctl-git
pkgver=0.1.r7.0fdfe7c
pkgrel=4
pkgdesc='Unofficial Linux driver for the Sennheiser BTD 700 USB Bluetooth dongle'
arch=('x86_64' 'aarch64')
url='https://github.com/sobalap/btd700ctl'
license=('LGPL-2.1-only')
depends=('hidapi')
makedepends=('git' 'cmake')
provides=("btd700ctl=$pkgver")
conflicts=('btd700ctl')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf '%s.r%s.%s' \
    "$(grep 'project(' -A2 CMakeLists.txt | grep -oP 'VERSION\s+\K[0-9]+(\.[0-9]+)+')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's|/usr/local/bin/btd700d|/usr/bin/btd700d|' "$pkgname/daemon/btd700d.service"
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm755 build/btd700_example "$pkgdir/usr/bin/btd700ctl"

  cd "$pkgname"
  install -Dm644 udev/99-btd700.rules "$pkgdir/usr/lib/udev/rules.d/99-btd700.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
