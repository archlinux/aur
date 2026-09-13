# Maintainer: Kohei Wada <https://github.com/Kohei-Wada>
#
# Reference PKGBUILD, kept in-tree as the source of truth; the AUR
# copy lives in aur.archlinux.org/ttymap.git.
#
# On each release: bump pkgver, refresh sha256sums (`updpkgsums`),
# then push to the AUR repo.

pkgname=ttymap
pkgver=0.3.1
pkgrel=1
pkgdesc='Scriptable globe for the terminal — Mapbox Vector Tiles rendered as Unicode Braille'
arch=('x86_64' 'aarch64')
url='https://github.com/Kohei-Wada/ttymap'
license=('MIT' 'Apache-2.0')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
# mlua compiles Lua 5.4 from vendored C sources. Under makepkg's
# default `lto` option that C code is built with -flto=auto, so the
# static lib carries GCC LTO IR that rust-lld cannot read and every
# lua_* symbol comes back undefined at link time.
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('54bd19b1f49bceee29967ab5802c5f38b5160c3acb3c83cf47932b3571b218b7')

prepare() {
  cd "$pkgname-$pkgver"
  # Vendor dependencies up front so build() runs without network,
  # as makepkg expects.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # The IPC round-trip test spawns the built binary; no network.
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  # install-system stages bin/ + share/ttymap/ under $pkgdir; it
  # never touches the live filesystem and never needs root. Its
  # cargo build is a cache hit on build()'s output (same
  # CARGO_TARGET_DIR), so nothing is fetched or recompiled here.
  make install-system DESTDIR="$pkgdir" PREFIX=/usr

  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
