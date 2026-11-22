# Maintainer: adelmonte
pkgname=evince-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight GTK3 document viewer written in Rust (port of Evince)"
arch=('x86_64')
url="https://github.com/adelmonte/evince-rs"
license=('GPL-2.0-or-later')
depends=('cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gsettings-desktop-schemas' 'gtk3'
         'hicolor-icon-theme' 'libarchive' 'libsynctex' 'libtiff' 'pango' 'poppler-glib')
makedepends=('cargo')
optdepends=('gvfs: for session saving and bookmarking'
            'texlive-bin: DVI support'
            'bzip2: bzip2-compressed documents'
            'xz: xz-compressed documents')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76fdbe18b281c4a16c38c2898518c81c5540ed54472d24ed27ac5c8271014ece')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  make CARGO_FLAGS="--frozen --no-default-features"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  make check CARGO_FLAGS="--frozen --no-default-features"
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
