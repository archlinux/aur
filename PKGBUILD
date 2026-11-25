# skwird for the AUR (docs/DESIGN.md, decision 11): built from a release's
# source with Arch's own Rust, the same files as the Debian and RPM
# packages (crates/skwird/Cargo.toml). Nothing is enabled nor started:
# pacman's hooks make the system service's user (sysusers) and tell the
# service manager. Its removal stops the system service and lets go of
# its index, as theirs does (skwird.install).
# skwird's repository builds it from its own tree, as from a release
# (tools/package/aur.sh), its checksum SKIP; the AUR's copy holds the
# tag's archive's (updpkgsums).
# Maintainer: The skwir authors

pkgname=skwird
pkgver=0.2.0
pkgrel=1
pkgdesc='An index of file names kept current, answered over a local socket'
arch=('x86_64' 'aarch64')
url='https://skwir.org'
# Where its releases are published.
_repo='https://github.com/skwir-org/skwird'
license=('MIT OR Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
install=skwird.install
source=("$pkgname-$pkgver.tar.gz::$_repo/archive/v$pkgver.tar.gz")
sha256sums=('78a33d216159469757505f186a4c9e68532662183723bbd331b22f2f145f2b0c')

prepare() {
  cd "$pkgname-$pkgver"
  # The tree's rust-toolchain.toml names its checks' Rust: a package is
  # built with the system's.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --profile dist -p skwird --bin skwird
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/dist/skwird -t "$pkgdir/usr/bin"
  install -Dm644 dist/systemd/skwird.service dist/systemd/skwird.socket -t "$pkgdir/usr/lib/systemd/user"
  install -Dm644 dist/systemd/skwird-system.service -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 dist/sysusers/skwird.conf -t "$pkgdir/usr/lib/sysusers.d"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
