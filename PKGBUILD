# Maintainer: Tarrin Leary <tarrin@example.invalid>
pkgname=ion-nemesis-cli
pkgver=2.1.0
pkgrel=5
pkgdesc="iON command-line pipeline for mobile acquisition, decrypt, evidence extraction, review, and export"
arch=('x86_64')
url="https://github.com/VanHoney-ltd/iON-Data-Systems-powered-by-the-NEMESIS-ENGINE"
license=('LicenseRef-iON-Source-Available')
depends=('libimobiledevice' 'openssl' 'sqlite')
makedepends=('cargo' 'git' 'rust')
provides=('chronos' 'helios' 'minios')
conflicts=('ion-data-systems')
options=('!debug')
_source_branch=nemesis-cli-aur-ready
source=("$pkgname::git+$url.git#branch=$_source_branch")
sha256sums=('SKIP')

_private_payload_guard() {
  local private_patterns=(
    '/backups/'
    '/cases/'
    '/prepared/'
    '/attachments/'
    '/nemesis-desktop/'
    '/ion/frontend/'
    '/pcr'
  )

  local packaged_files
  packaged_files="$(find "$pkgdir" -type f -o -type l)"

  local pattern
  for pattern in "${private_patterns[@]}"; do
    if grep -Fq "$pattern" <<<"$packaged_files"; then
      printf 'Refusing to package private path pattern: %s\n' "$pattern" >&2
      return 1
    fi
  done
}

build() {
  cd "$srcdir/$pkgname"

  unset RUSTFLAGS CARGO_ENCODED_RUSTFLAGS CARGO_BUILD_RUSTFLAGS
  unset LDFLAGS CFLAGS CXXFLAGS DEBUG_CFLAGS DEBUG_CXXFLAGS
  export RUSTFLAGS="--remap-path-prefix=$srcdir/$pkgname=/usr/src/$pkgname --remap-path-prefix=$HOME/.cargo/registry/src=/usr/src/cargo/registry"

  cd "$srcdir/$pkgname/core"
  CARGO_TARGET_DIR="$srcdir/.pkg-target/core" \
    cargo build --release --locked --bin chronos --bin minios --bin minios-export

  cd "$srcdir/$pkgname/HELiOS"
  CARGO_TARGET_DIR="$srcdir/.pkg-target/helios" \
    cargo build --release --locked --bin helios
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$srcdir/.pkg-target/core/release/chronos" "$pkgdir/usr/bin/chronos"
  install -Dm755 "$srcdir/.pkg-target/core/release/minios" "$pkgdir/usr/bin/minios"
  install -Dm755 "$srcdir/.pkg-target/core/release/minios-export" "$pkgdir/usr/bin/minios-export"
  install -Dm755 "$srcdir/.pkg-target/helios/release/helios" "$pkgdir/usr/bin/helios"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  _private_payload_guard
}
