# Maintainer: Josip Janzic <hi@josip.dev>

pkgname=libopensdg-git
pkgver=1.0.3.r0.gdd564d6
pkgrel=1
pkgdesc="Free and open SecureDeviceGrid protocol client side implementation"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Sonic-Amiga/opensdg"
license=('GPL3')
depends=('libsodium' 'protobuf-c')
makedepends=('git' 'cmake')
provides=("libopensdg=$pkgver")
conflicts=('libopensdg')
source=("git+https://github.com/Sonic-Amiga/opensdg" "extern_main_cb.patch")
sha256sums=('SKIP' 'bc7fe4edbc4bd7cc8415ddd82a3b7b6d5b33d2bff323a1a55ebccee2efa041c2')


pkgver() {
  cd "opensdg"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "opensdg"

  git apply "$srcdir/extern_main_cb.patch"

  mkdir -p release
  cd release
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make opensdg
}

package() {
  cd "opensdg/release"

  make DESTDIR="$pkgdir" install
  install -Dm644 "../LICENSE.txt" -t "$pkgdir/usr/share/licenses/opensdg"
}

