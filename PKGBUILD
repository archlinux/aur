# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.7.1
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://apps.gnome.org/app/org.gnome.gitlab.YaLTeR.VideoTrimmer"
license=('GPL3')
depends=('ffmpeg' 'gtk4' 'gst-plugins-good' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/YaLTeR/video-trimmer/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6abbbe29cc0c5101e8d6e5a001a9573fab3cb733a12ed39527e89a1262a1095e')

prepare() {
  cd "$pkgname-v$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
