# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
pkgname=cfetch-agent
pkgver=0.9.0
pkgrel=1
pkgdesc="A second brain for coding agents: privilege-ring memory, hook injection, retrieval, and a code index in one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/julian-corbet/cfetch"
license=('LicenseRef-FSL-1.1-ALv2')
provides=('cfetch')
conflicts=('cfetch')
# !lto: the cc-crate builds sqlite3.c with the ambient CFLAGS; under makepkg's global
# lto option that produces GCC-LTO bitcode objects, which rust-lld cannot consume —
# the archive links "successfully empty" and every sqlite3_* symbol goes missing.
options=('!lto')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/julian-corbet/cfetch.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  cargo fetch --locked
}

build() {
  cd "$pkgname"
  cargo build --release --locked
}

check() {
  cd "$pkgname"
  cargo test --release --locked
}

package() {
  cd "$pkgname"
  # The cargo bin target is `cfetch` (the package base differs only because the AUR
  # name was taken); the file must be /usr/bin/cfetch — units and hooks exec that path,
  # and provides=('cfetch') is a virtual name, not a file.
  install -Dm755 target/release/cfetch "$pkgdir/usr/bin/cfetch"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
