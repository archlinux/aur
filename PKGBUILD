# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clipboard-manager-git
pkgver=r105.d87bd4b
pkgrel=1
pkgdesc="Clipboard manager for COSMIC™"
arch=('x86_64')
url="https://github.com/cosmic-utils/clipboard-manager"
license=('GPL3-or-later')
depends=('cosmic-applets')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'cosmic-clipboard-manager-git')
options=('!lto')  # sqlx crate fails with LTO enabled
source=('git+https://github.com/cosmic-utils/clipboard-manager.git')
sha256sums=('SKIP')

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
}
