# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=kana-gtk4-git
pkgver=1.4.r0.gf8b479e
pkgrel=1
pkgdesc="Learn Japanese characters (latest commit)"
url="https://gitlab.gnome.org/fkinoshita/kana"
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('gst-plugins-bad-libs' 'libadwaita')
makedepends=('cargo' 'git' 'meson')
checkdepends=('appstream-glib')
provides=("kana-gtk4")
conflicts=("kana-gtk4")
source=("git+$url.git") #tag=v$pkgver
sha256sums=('SKIP')

pkgver() {
  cd kana
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd kana
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/CARGO_HOME"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson kana build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
# Resolve file conflict with kana-git
  sed -i -E "s|Exec=kana|Exec=kana-gtk4|g" "$pkgdir/usr/share/applications/com.felipekinoshita.Kana.desktop"
  mv "$pkgdir/usr/bin/kana" "$pkgdir/usr/bin/kana-gtk4"
}
