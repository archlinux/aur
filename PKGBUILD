# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=examine-git
pkgver=r14.385da59
pkgrel=1
pkgdesc="A system information viewer for the COSMIC™ Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/examine"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libxkbcommon')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-utils/examine.git')
sha256sums=('SKIP')

pkgver() {
  cd examine
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd examine
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd examine
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd examine
  just rootdir="$pkgdir" install
}
