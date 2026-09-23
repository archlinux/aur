# Maintainer: Mahmoud Walid <modywmbadr@gmail.com>
#
# Builds Norupo from the tagged source release. Prefer `norupo-bin` if you do
# not want to compile Rust locally.

pkgname=norupo
pkgver=0.1.1
pkgrel=1
pkgdesc="Self-hosted local tunneling service (edge server + CLI agent), like ngrok"
arch=('x86_64' 'aarch64')
url="https://github.com/Mahmoud-walid/Norupo-tunnel"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=(
  'redis: shared routing table for multi-node edge deployments'
)
provides=('norupo' 'norupo-server')
conflicts=('norupo-bin' 'norupo-git')
backup=('etc/norupo/server.env')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96c8773a3f14e087b1b1615c88c7727e5a42434d6dc615dd3ecf34aadf01ff8c')

_srcdir="Norupo-tunnel-$pkgver"

prepare() {
  cd "$_srcdir"
  # Vendor the dependency graph up front so build() can run with --frozen,
  # which is what makes the package reproducible.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_srcdir"
  export RUSTUP_TOOLCHAIN=stable
  # The end-to-end suite binds only loopback ports, so it is safe in a
  # sandboxed build chroot.
  cargo test --frozen --workspace
}

package() {
  cd "$_srcdir"

  install -Dm0755 "target/release/norupo" "$pkgdir/usr/bin/norupo"
  install -Dm0755 "target/release/norupo-server" "$pkgdir/usr/bin/norupo-server"

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 docs/ARCHITECTURE.md "$pkgdir/usr/share/doc/$pkgname/ARCHITECTURE.md"
  install -Dm0644 docs/SCALING.md "$pkgdir/usr/share/doc/$pkgname/SCALING.md"

  # Optional server unit; the CLI agent needs none of this.
  install -Dm0644 packaging/systemd/norupo-server.service \
    "$pkgdir/usr/lib/systemd/system/norupo-server.service"
  install -Dm0644 packaging/systemd/server.env \
    "$pkgdir/etc/norupo/server.env"
}
