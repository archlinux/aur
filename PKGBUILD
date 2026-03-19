# Maintainer: futpib-bot <futpib-bot@proton.me>
pkgname=attach-git
pkgver=r11.g36a00c3
pkgrel=1
pkgdesc="A command-line tool for managing and attaching to terminals in Docker containers and tmux sessions"
arch=('x86_64')
url="https://github.com/futpib/attach"
license=('unknown')
depends=('gcc-libs')
optdepends=('docker: for docker:// targets'
            'tmux: for tmux:// targets')
makedepends=('cargo' 'git')
provides=("attach=${pkgver}")
conflicts=('attach')
source=("${pkgname}::git+https://github.com/futpib/attach.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/attach" "$pkgdir/usr/bin/attach"
}
