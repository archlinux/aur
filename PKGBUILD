# Maintainer: CPT-Dawn <ping@cptdawn.dev>
pkgname=vellum
pkgver=2.0.2
pkgrel=1
pkgdesc="Featherweight wallpaper manager for Wayland: a tiny daemon, CLI and TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Vellum"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo')
conflicts=('vellum-bin' 'vellum-git')
_tag=v2.0.2
_srcdir=Vellum-2.0.2
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('7565d2a19d56ee8e2b92f2c0d979dcbd5029908d27e05a7d3e853abc665a18d8')

prepare() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --workspace
  bash packaging/gen-docs.sh target/release/vellum target/dist
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Unit tests only: the integration suites drive a headless Sway.
  cargo test --frozen --release --workspace --lib --bins
}

package() {
  cd "$_srcdir"
  install -Dm755 target/release/vellum target/release/vellumd -t "$pkgdir/usr/bin"
  install -Dm644 packaging/systemd/vellumd.service -t "$pkgdir/usr/lib/systemd/user"

  install -Dm644 target/dist/completions/vellum.bash \
    "$pkgdir/usr/share/bash-completion/completions/vellum"
  install -Dm644 target/dist/completions/_vellum -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm644 target/dist/completions/vellum.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm644 target/dist/man/*.1 -t "$pkgdir/usr/share/man/man1"

  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
