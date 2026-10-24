# Maintainer: Olaf Wriggers <olaf@olwig.xyz>

pkgname=cosmic-ext-applet-privacy-indicator
pkgver=0.3.1
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
conflicts=("${pkgname}-git")

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e5e87688f4b8963adc088987d062d962b79917ec5ca057dd43583d91424f04bf')

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
