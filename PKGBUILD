# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-store-git
pkgver=r64.01eb413
pkgrel=1
pkgdesc="WIP COSMIC app store"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-store"
license=('GPL-3.0-or-later')
groups=('cosmic')
depends=('flatpak')
makedepends=(
  'cargo'
  'git'
  'just'
)
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/pop-os/cosmic-store.git'
        'git+https://github.com/jackpot51/appstream.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.appstream.url "$srcdir/appstream"
  git -c protocol.file.allow=always submodule update

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just vendor
}

build() {
  cd "${pkgname%-git}"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  just build-vendored
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}
