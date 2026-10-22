# Maintainer: Marco Ziliani (rylos)
pkgname=abb-agent
_pkgname=abb-agent
pkgver=0.2.2
pkgrel=1
pkgdesc="Replacement for the Synology Active Backup for Business Linux agent: any distro and kernel, first-class btrfs, bare-metal restore (https://github.com/rylos/abb-agent)"
arch=('x86_64' 'aarch64')
url="https://github.com/rylos/abb-agent"
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('cargo')
conflicts=("$_pkgname-git" "$_pkgname-bin")
backup=('etc/abb-agent.toml')
# ring compiles C code: GCC LTO objects cannot be linked by the Rust toolchain.
options=('!lto')
install=abb-agent.install
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c2025bb96f889a333ac67550984b4583c60b2af60e32377fb5ef4f8d76f3bb54')

prepare() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p abb-agent -p abb-restore
}

check() {
  cd "$_pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/abb-agent "$pkgdir/usr/bin/abb-agent"
  install -Dm755 target/release/abb-restore "$pkgdir/usr/bin/abb-restore"
  install -Dm644 packaging/systemd/abb-agent.service "$pkgdir/usr/lib/systemd/system/abb-agent.service"
  install -Dm644 packaging/systemd/abb-agent-fixup.service "$pkgdir/usr/lib/systemd/system/abb-agent-fixup.service"
  install -Dm644 packaging/abb-agent.toml "$pkgdir/etc/abb-agent.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
