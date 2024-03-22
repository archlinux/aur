# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=switcheroo-gtk4
pkgver=2.1.0
pkgrel=2
pkgdesc="Convert and manipulate images"
url="https://gitlab.com/adhami3310/Switcheroo"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('gdk-pixbuf2' 'ghostscript' 'highway' 'imagemagick' 'imath' 'libadwaita' 'libde265'
         'libheif' 'libjxl' 'liblqr' 'librsvg' 'openexr' 'webp-pixbuf-loader' 'x265')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd Switcheroo
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson Switcheroo build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
# Resolve a file conflict with another switcheroo
  sed -i -E "s|Exec=switcheroo|Exec=$pkgname|g" "$pkgdir/usr/share/applications/io.gitlab.adhami3310.Converter.desktop"
  mv "$pkgdir/usr/bin/switcheroo" "$pkgdir/usr/bin/$pkgname"
}
