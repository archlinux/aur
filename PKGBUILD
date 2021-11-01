# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=2.0.1
pkgrel=2
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://apps.gnome.org/app/io.github.seadve.Kooha"
license=('GPL3')
depends=('gst-plugin-pipewire' 'gstreamer-vaapi' 'gst-plugins-ugly' 'gtk4' 'libadwaita'
         'python-gobject' 'x264' 'xdg-desktop-portal')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
sha256sums=('984ee062fabfe6bbdf8024dd5e4d1c5ce2fafc3b75539f2ba52449bdd4cc3f98')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Kooha/archive/v$pkgver.tar.gz")

prepare() {
  cd Kooha-$pkgver
  export RUSTUP_TOOLCHAIN=stable
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
  meson install -C build --destdir "$pkgdir"
}
