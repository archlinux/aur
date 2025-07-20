# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: ftsell <aur@finn-thorben.me>
pkgname=pop-shell-shortcuts-git
pkgver=r30.52cc83f
pkgrel=2
epoch=1
pkgdesc="Application for displaying and demoing Pop Shell shortcuts"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/shell-shortcuts"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=(
  'cargo'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/shell-shortcuts.git')
sha256sums=('SKIP')

pkgver() {
  cd shell-shortcuts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd shell-shortcuts
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd shell-shortcuts
  export RUSTUP_TOOLCHAIN=stable
  make prefix=/usr
}

package() {
  cd shell-shortcuts
  make prefix=/usr DESTDIR="$pkgdir" install
}

