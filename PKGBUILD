# Maintainer: Jeff Glover <js dot glover at gmail dot com>

pkgname=todoist-rs-git
_pkgname=todoist-rs
pkgver=0.0.4.r0.g36e0dd0
pkgrel=1
pkgdesc="A terminal client for Todoist, (inspired by Spotify-TUI)."
arch=('x86_64')
url="https://github.com/illiteratewriter/todoist-rs"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=()
makedepends=('cargo' 'git')
source=("${_pkgname}::git+$url#branch=master")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --release --locked
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 target/release/todoist -t "${pkgdir}/usr/bin"
}
