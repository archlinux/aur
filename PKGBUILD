# Maintainer: adelmonte
pkgname=image-view
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal keyboard-driven image viewer (egui port of qView)"
arch=('x86_64' 'aarch64')
url="https://github.com/adelmonte/image-view"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'lcms2' 'libglvnd' 'libxkbcommon' 'wayland' 'hicolor-icon-theme')
makedepends=('cargo')
optdepends=('xdg-desktop-portal: open and save file dialogs'
            'xdg-utils: open containing folder and the settings file'
            'libx11: X11 support'
            'libxcursor: X11 support'
            'libxi: X11 support')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3741e9bd52fb8f2a8300298bae18a4fd0573a44854014134546c6fb95994b237')

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
