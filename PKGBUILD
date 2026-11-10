# Maintainer: Tiago Correia
#
# AUR package built from source. scripts/aur.sh fills in pkgver and the
# checksum of the release tarball and writes .SRCINFO; see docs/release.md.
pkgname=lazybw
pkgver=1.2.0
pkgrel=1
pkgdesc="A keyboard-first terminal UI for the Bitwarden vault"
arch=('x86_64' 'aarch64')
url="https://github.com/SyscallBrain/lazybw"
license=('MIT')
depends=('glibc' 'libgcc')
depends_x86_64=('bitwarden-cli')
optdepends_aarch64=('bitwarden-cli: the Bitwarden CLI that lazybw drives (or npm i -g @bitwarden/cli)')
makedepends=('cargo')
# The release profile already strips the binary: a -debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('63944095d5cb152bed1aa9e7e1286db6f003b3f422c1f26864106c56eb0ff8e8')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p lazybw
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -p lazybw --lib
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/lazybw "$pkgdir/usr/bin/lazybw"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
