# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=video-trimmer
pkgver=0.8.2
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://apps.gnome.org/VideoTrimmer"
license=('GPL3')
depends=('ffmpeg' 'gst-plugins-good' 'libadwaita')
makedepends=('blueprint-compiler' 'cargo' 'git' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.gnome.org/YaLTeR/video-trimmer/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6bada3db4a553a2dab543e18228233262f3ab177e73de2360e17236a13c51c5f')

prepare() {
  cd "$pkgname-v$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
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
