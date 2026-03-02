# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=quick-webapps
_app_id=dev.heppen.webapps
pkgver=3.0.0
pkgrel=1
pkgdesc="Web App Manager for the COSMIC™ desktop written with love and libcosmic."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/web-apps"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'hicolor-icon-theme'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
makedepends=(
  'cargo'
  'git'
  'just'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
conflicts=('cosmic-wam' 'cosmic-webapps')
source=("git+https://github.com/cosmic-utils/web-apps.git#tag=$pkgver")
sha256sums=('2411f1f61518a0c9a9910f38873b1e9a37776b17928ac90236a7725eafda0007')

prepare() {
  cd web-apps
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc --print host-tuple)"
}

build() {
  cd web-apps
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  just build
}

check() {
  cd web-apps
  appstreamcli validate --no-net "resources/${_app_id}.metainfo.xml"
  desktop-file-validate "resources/${_app_id}.desktop"
}

package() {
  cd web-apps
  just base-dir="$pkgdir/usr" install
}
