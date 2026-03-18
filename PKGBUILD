# Maintainer: Jonathan Capps <hello at cappsy dot dev>
pkgname=tesseract-timer-git
pkgver=v0.1.2.r7.ga229a69
pkgrel=1
pkgdesc="A speed cubing timer for the COSMIC™ desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/cappsyco/tesseract"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cappsyco/tesseract.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-timer-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-timer-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-timer-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-timer-git}"
  just rootdir="$pkgdir" install
}

