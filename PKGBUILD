# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=switcheroo-gtk4
pkgname=$_pkgname-git
pkgver=2.1.0.r1.g5fda201
pkgrel=1
pkgdesc="Convert and manipulate images (latest commit)"
url="https://gitlab.com/adhami3310/Switcheroo"
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
depends=('gdk-pixbuf2' 'ghostscript' 'highway' 'imagemagick' 'imath' 'libadwaita' 'libde265'
         'libheif' 'libjxl' 'liblqr' 'librsvg' 'openexr' 'webp-pixbuf-loader' 'x265')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd Switcheroo
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  sed -i -E "s|Exec=switcheroo|Exec=$_pkgname|g" "$pkgdir/usr/share/applications/io.gitlab.adhami3310.Converter.desktop"
  mv "$pkgdir/usr/bin/switcheroo" "$pkgdir/usr/bin/$_pkgname"
}
