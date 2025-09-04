
# Maintainer: Attila Greguss <floyd0122@gmail.com>
pkgname=cosmic-ext-applet-privacy-indicator-git
pkgver=r11.2d3b0ef
pkgrel=1
pkgdesc="Privacy indicator for the COSMIC Desktop."
arch=('x86_64')
url="https://github.com/D-Brox/cosmic-ext-applet-privacy-indicator"
license=('GPL-3.0')
depends=(
	'cosmic-applets'
	'libxkbcommon'
  'libpipewire'
)
makedepends=(
  'cargo'
  'git'
  'just'
  'clang'
  'llvm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+https://github.com/D-Brox/cosmic-ext-applet-privacy-indicator"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
