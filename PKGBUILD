# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Tim Schumacher <timschumi@gmx.de>

pkgname=heimdall-git
_pkgname=Heimdall
pkgver=2.2.2.r0.gd9554e7
pkgrel=1
pkgdesc="Tool suite used to flash firmware (ROMs) onto Samsung Galaxy S devices (grimler fork)"
arch=(x86_64)
url="https://git.sr.ht/~grimler/Heimdall"
license=(MIT)
depends=(
  gcc-libs
  glibc
  libusb
  zlib
)
makedepends=(
  cmake
  qt6-base
)
optdepends=(
  "qt6-base: GUI support for heimdall-frontend"
)
source=(
  $_pkgname::git+https://git.sr.ht/~grimler/Heimdall
  heimdall.desktop
)
sha256sums=(
  "SKIP"
  "439cea1a8976b9b589ffe4030a084243bcc5e937dcb9c571cdb94d3ff08b4fb4"
)
conflicts=(heimdall)
provides=(heimdall)

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $_pkgname
    -W no-dev
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

package() {
  install -vDm 755 build/bin/* -t "$pkgdir"/usr/bin/
  install -vDm 644 $_pkgname/heimdall/60-heimdall.rules -t "$pkgdir"/usr/lib/udev/rules.d/
  install -vDm 644 heimdall.desktop -t "$pkgdir/usr/share/applications/"
  install -vDm 644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
