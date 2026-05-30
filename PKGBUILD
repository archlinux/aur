# Maintainer: Julian Xhokaxhiu <https://julianxhokaxhiu.com>

pkgname=librocdxg
pkgver=1.2.0
pkgrel=1
pkgdesc="A user-mode library that enables ROCm functionality on Windows Subsystem for Linux (WSL)"
arch=('x86_64')
url="https://github.com/ROCm/librocdxg"
license=('MIT')
makedepends=(
  'cmake'
  'make'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ROCm/librocdxg/archive/v${pkgver}.tar.gz")
sha256sums=('bae9c068e9c08a0b7c42dd005abd7b9c62248ace49ccd1f49bf508167a15f4f0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  WIN_SDK='/mnt/c/Program Files (x86)/Windows Kits/10/Include/10.0.26100.0/'

  # Build the library
  mkdir -p build
  cd build
  cmake .. -DWIN_SDK="${WIN_SDK}/shared"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cd build
  make DESTDIR="$pkgdir/" install

  install -Dm644 /dev/stdin "$pkgdir/etc/profile.d/$pkgname.sh" <<EOF
export HSA_ENABLE_DXG_DETECTION=1
EOF
}
