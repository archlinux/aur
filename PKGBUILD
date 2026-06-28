# Maintainer: myuki <mioki dot cinnamon650 at 8shield dot net>

pkgname=mihomo-tui-git
_pkgname=mihomo-tui
pkgver=0.4.4.r0.g803d8f9
pkgrel=1
pkgdesc="A TUI for Mihomo (Clash.Meta) - git version"
arch=('x86_64' 'aarch64')
url="https://github.com/potoo0/mihomo-tui"
license=('MIT')
makedepends=('cargo' 'git')
optdepends=('mihomo: Another Clash Kernel by MetaCubeX')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+https://github.com/potoo0/mihomo-tui.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_HOME="$srcdir/.cargo-home"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS} --cfg tokio_unstable --remap-path-prefix=$srcdir=/"
  export CARGO_PROFILE_RELEASE_DEBUG=true
  export CARGO_TARGET_DIR=target
  export CARGO_HOME="$srcdir/.cargo-home"
  cargo build --frozen --offline --release --all-features
}

package() {
  cd "$_pkgname"
  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/mihomo-tui"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
