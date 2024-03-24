# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mousai
_app_id=io.github.seadve.Mousai
pkgver=0.7.7
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
checkdepends=(
  'appstream'
#  'xorg-server-xvfb'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeaDve/Mousai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f99f717bd9516dd6db92276a1a171ea97e2caa8f77e9d38fdf32218690a9cc27')

prepare() {
  cd "Mousai-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "Mousai-$pkgver" build
  meson compile -C build
}

check() {
#  export CARGO_HOME="$srcdir/cargo-home"
#  export RUSTUP_TOOLCHAIN=stable
#  xvfb-run -a -s "-screen 0 1024x768x24" dbus-run-session meson test -C build --print-errorlogs || :

  appstreamcli validate --no-net "build/data/${_app_id}.metainfo.xml" || :
  desktop-file-validate "build/data/${_app_id}.desktop"
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
