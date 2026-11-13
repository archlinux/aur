# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gitmun
pkgver=0.14.3
pkgrel=1
_commit=bf47c70
pkgdesc="A cross-platform Git GUI built with Tauri"
arch=(x86_64)
url="https://github.com/cst8t/gitmun"
license=(GPL-3.0-only)
depends=(
  cairo
  desktop-file-utils
  gdk-pixbuf2
  git
  glib2
  gtk-update-icon-cache
  gtk3
  hicolor-icon-theme
  libsoup3
  pango
  webkit2gtk-4.1
  xdg-desktop-portal
  zenity
)
makedepends=(npm cargo-tauri)
options=(!lto)
source=("$pkgname::git+$url#commit=$_commit")
sha256sums=('4389431967073d31e53c83a4257dc49d68d89bc9eead7803b3cbd07ec35eb5a1')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname"
    npm install --cache "$srcdir/npm-cache"
    cd src-tauri
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    npm run generate:icons
    npm run tauri build -- --bundles deb --no-sign
}

package() {
    (
        cd "$pkgname/src-tauri/target/release/bundle/deb/Gitmun_0.1.0_amd64/data"
        cp -a . "$pkgdir"
    )
    cd "$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
