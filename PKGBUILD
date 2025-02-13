# Maintainer: Marco Costanzo <thedumberspacecore096 at gmail dot com>
pkgname=yogabook-touch-keyboard
pkgver=1.4.2
pkgrel=1
pkgdesc="YogaBook touch keyboard handler"
arch=('x86_64')
url="https://github.com/jekhor/chromiumos_touch_keyboard"
license=('LicenseRef-BSD-Google AND LicenseRef-Unknown')
depends=(
  gcc-libs
  glibc
)
makedepends=('git' 'cmake')
backup=(
  'etc/touch_keyboard/layout.csv'
  'etc/touch_keyboard/layout-touchpad.csv'
)
_commit=5f1c913649be34d50be83b2e12438ad10dfc1a9f
source=(
  "$pkgname-$pkgver::git+https://github.com/jekhor/chromiumos_touch_keyboard.git#commit=${_commit}"
  "CMakeLists-fix-paths.patch"
  "service-fix-paths.patch"
)
sha256sums=(
  'acb209481ac64a86d442abc82f4090493a6d300ca66ee63d24ca45b08e902a76'
  '8888d0fd5a36eeda42e234948ab491095980819b473b87760ab7d006c2bde6b4'
  '4e7a07d115ff8feece67b4b6a466dac2b80060da6e7259e40722105f0946d440'
)
install="$pkgname.install"

prepare() {
  patch -d "$pkgname-$pkgver" -Np1 -i ../CMakeLists-fix-paths.patch
  patch -d "$pkgname-$pkgver" -Np1 -i ../service-fix-paths.patch
}

build() {
  cd "$pkgname-$pkgver"
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}
