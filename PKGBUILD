# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.6.1
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://apps.gnome.org/app/org.gnome.gitlab.YaLTeR.VideoTrimmer"
license=('GPL3')
depends=('ffmpeg' 'gtk4' 'gst-plugins-good' 'libadwaita')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/YaLTeR/video-trimmer/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('afe6a3e1975af0396bf92efb59b4cca289d4417300499396e4bde55a08240a38')

prepare() {
  cd "$pkgname-v$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
  DESTDIR="$pkgdir" meson install -C build
}
