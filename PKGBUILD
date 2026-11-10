# Maintainer: Konrad Guzek <konrad@guzek.uk>

pkgname=beacon-cli-git
pkgver=0.1.0.r31.g0aa9338
pkgrel=1
pkgdesc='Beacon status-page client with Waybar JSON output'
arch=('x86_64' 'aarch64')
url='https://git.guzek.uk/kguzek/beacon'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
optdepends=('waybar: display status in a custom module')
provides=("beacon-cli=${pkgver}")
conflicts=('beacon-cli')
options=('!lto' '!debug')
source=('beacon::git+https://git.guzek.uk/kguzek/beacon.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/beacon"
  local version
  version=$(sed -n 's/^version = "\([^"]*\)"/\1/p' apps/cli/Cargo.toml)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/beacon"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$srcdir/beacon"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p beacon-cli
}

check() {
  cd "$srcdir/beacon"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p beacon-cli -p beacon-core
}

package() {
  cd "$srcdir/beacon"
  install -Dm755 target/release/beacon-cli "$pkgdir/usr/bin/beacon-cli"
  install -Dm644 apps/cli/README.md "$pkgdir/usr/share/doc/beacon-cli/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
