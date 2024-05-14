# Maintainer: pinapelz <yukais@pinapelz.com>

pkgname=oxi-sapphire-launcher-git
pkgver=0.2.0
pkgrel=1
pkgdesc="A crossplatform CLI launcher for FFXIV Sapphire servers"
arch=('x86_64')
url="https://github.com/T00fy/oxi-sapphire-launcher"
license=('unknown')
makedepends=('git' 'cargo' 'unshield')
depends=('unshield')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/T00fy/oxi-sapphire-launcher.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/oxi-sapphire-launcher"
  git fetch --tags --force
  local ver="$(git describe --tags --abbrev=0)"
  local rev="$(git rev-list --count ${ver}..HEAD)"
  local hash="$(git rev-parse --short HEAD)"
  echo "${ver}.r${rev}.${hash}"
}

prepare(){
    cd "$srcdir/oxi-sapphire-launcher"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/oxi-sapphire-launcher"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "$srcdir/oxi-sapphire-launcher"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/oxi-sapphire-launcher"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
}
