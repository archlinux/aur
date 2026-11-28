# Maintainer: adelmonte
pkgname=image-view
pkgver=0.2.1
pkgrel=1
pkgdesc="Minimal keyboard-driven image viewer (egui port of qView)"
arch=('x86_64' 'aarch64')
url="https://github.com/adelmonte/image-view"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'lcms2' 'libglvnd' 'libxkbcommon' 'wayland' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=('xdg-desktop-portal: open and save file dialogs'
            'xdg-utils: open containing folder and the settings file')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1a44af33bcbef15f34ebca721d386324d5742d1c2e826d9b36ffa993e3a910a6')

_host() {
  rustc -vV | sed -n 's/^host: //p'
}

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(_host)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/build"
  cargo build --frozen --release --target "$(_host)"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release --target "$(_host)"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/$(_host)/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "dist/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  for d in dist/hicolor/*/apps; do
    size=$(basename "$(dirname "$d")")
    for f in "$d"/*; do
      ext="${f##*.}"; case "$f" in *symbolic*) name=$pkgname-symbolic;; *) name=$pkgname;; esac
      install -Dm644 "$f" "$pkgdir/usr/share/icons/hicolor/$size/apps/$name.$ext"
    done
  done
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
