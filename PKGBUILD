# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mousai
_app_id=io.github.seadve.Mousai
pkgver=0.7.8
pkgrel=1
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://apps.gnome.org/Mousai"
license=('GPL-3.0-or-later')
depends=(
  'gst-plugins-bad-libs'
  'gst-plugins-good'
  'gstreamer'
  'libadwaita'
  'libpulse'
  'libsoup3'
)
makedepends=(
  'cargo'
  'meson'
)
#checkdepends=(
#  'xorg-server-xvfb'
#)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Mousai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a54d129c97c61260f85f43d436d0cd6dd52fe2e7aa40f33ba4640c1c7da0e231')

prepare() {
  cd "Mousai-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Mousai-$pkgver" build
  meson compile -C build
}

check() {
#  export RUSTUP_TOOLCHAIN=stable
#  xvfb-run -a -s "-screen 0 1024x768x24" dbus-run-session meson test -C build --print-errorlogs || :

  appstreamcli validate --no-net "build/data/${_app_id}.metainfo.xml"
  desktop-file-validate "build/data/${_app_id}.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
