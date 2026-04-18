# Maintainer: dan361 <daniel@m8t.io>
pkgname=drg_mod_integration-git
pkgver=0.2.10.r154.g57aa964
pkgrel=3
pkgdesc="Deep Rock Galactic mod loader and integration tool"
arch=('x86_64')
url="https://github.com/trumank/mint"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'libxkbcommon'
  'wayland'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
  'libgl'
  'fontconfig'
  'freetype2'
)
makedepends=(
  'git'
  'cargo'
  'rustup'
  'pkg-config'
  'mingw-w64-gcc'
)
provides=('drg_mod_integration-git' 'drg-mod-integration-bin' 'drg_mod_integration-notag-bin')
conflicts=('drg_mod_integration-git' 'drg-mod-integration-bin' 'drg_mod_integration-notag-bin')
source=(
  "${pkgname}::git+https://github.com/trumank/mint.git"
  "drg_mod_integration.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$pkgname"
  rm -f rust-toolchain.toml
  export RUSTUP_TOOLCHAIN=nightly
  rustup target add x86_64-pc-windows-gnu --toolchain nightly
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --features hook
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --release --features hook
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/mint" "$pkgdir/usr/bin/drg_mod_integration"

  # Desktop file
  install -Dm644 "$srcdir/drg_mod_integration.desktop" "$pkgdir/usr/share/applications/drg_mod_integration.desktop"

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
