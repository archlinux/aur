# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=2.0.0
pkgrel=2
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://apps.gnome.org/app/io.github.seadve.Kooha"
license=('GPL3')
depends=('gst-plugin-pipewire' 'gstreamer' 'gtk4' 'libadwaita' 'python-gobject'
         'xdg-desktop-portal')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
sha256sums=('bd56477d35b21cfb1fb5c7ccff539f6abc7f67c0809d4faaf453c99a1fcc7824')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Kooha/archive/v$pkgver.tar.gz")

prepare() {
  cd Kooha-$pkgver
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  arch-meson Kooha-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
