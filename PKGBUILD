# Maintainer: Omar <https://github.com/sazardev>
pkgname=shiki
pkgver=0.9.1
pkgrel=1
pkgdesc="TUI note-taking app with a Yazi-inspired three-pane layout and git-backed notebooks"
arch=('x86_64')
url="https://github.com/sazardev/shiki"
license=('MIT')
makedepends=('cargo')
conflicts=('shiki-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sazardev/shiki/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('007af6821cd5a448d76b350a4a95d6673556a1b2a115db24cb558851369ca4e7')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # makepkg.conf's hardening CFLAGS/LDFLAGS (-march=native, --as-needed,
  # -z,now, ...) are meant for C/C++ packages, not Rust — rustc itself
  # ignores them, but they still leak into any C build script a
  # dependency runs (aws-lc-sys, pulled in transitively via self_update's
  # reqwest+rustls), and that combination broke its static-lib link with
  # "undefined symbol: aws_lc_*" errors — a real failure hit and fixed
  # while testing this PKGBUILD, not a hypothetical. Unset them for the
  # Rust build specifically rather than fighting the flags themselves.
  unset CFLAGS CXXFLAGS LDFLAGS LTOFLAGS
  cargo build --frozen --release -p shiki-cli
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/shiki" "$pkgdir/usr/bin/shiki"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
