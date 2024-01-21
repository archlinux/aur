# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mousai
_app_id=io.github.seadve.Mousai
pkgver=0.7.6
pkgrel=1
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://apps.gnome.org/Mousai"
license=('GPL-3.0-or-later')
depends=('gst-plugins-bad-libs' 'gst-plugins-good' 'gstreamer' 'libadwaita'
         'libpulse' 'libsoup3')
makedepends=('cargo' 'meson')
checkdepends=('appstream-glib')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Mousai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a777e9c6ad310f2bb85ac88fc6f0de96e712ed49bed6905bc7e8e54820af4e37')

prepare() {
  cd "Mousai-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Mousai-$pkgver" build
  meson compile -C build
}

check() {
#  export CARGO_HOME="$srcdir/cargo-home"
#  export RUSTUP_TOOLCHAIN=stable
#  meson test -C build --print-errorlogs || :

  appstream-util validate-relax --nonet "build/data/${_app_id}.metainfo.xml"
  desktop-file-validate "build/data/${_app_id}.desktop"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
