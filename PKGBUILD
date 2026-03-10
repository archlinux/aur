# Maintainer: Olaf Wriggers <olaf at olwig dot xyz>
pkgname=cosmic-ext-applet-privacy-indicator
pkgver=0.2.0
pkgrel=1
pkgdesc="Privacy indicator for the COSMIC Desktop"
arch=('x86_64')
url="https://github.com/D-Brox/cosmic-ext-applet-privacy-indicator"
license=('GPL3')
depends=(
    'cosmic-applets'
    'libxkbcommon'
    'fontconfig'
    'libpipewire'
)
makedepends=(
  'cargo'
  'just'
  'clang'
  'llvm'
)
provides=("$pkgname")
conflicts=("$pkgname" "${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22d3b29c594112dfa1a0f0b5d223f8d19c2901c23f9286b1b92509c34b656d39')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
