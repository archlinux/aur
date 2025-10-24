# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## links
# https://vpn.mozilla.org
# https://github.com/mozilla-mobile/mozilla-vpn-client
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages

pkgname=mozillavpn
pkgver=2.32.0
pkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
arch=('x86_64')
url="https://vpn.mozilla.org"
license=('MPL-2.0')
depends=(
  'dbus'
  'freetype2'
  'hicolor-icon-theme'
  'libtiff'
  'libxcb'
  'libxdmcp'
  'libxmu'
  'libxrender'
  'polkit'
  'qt6-5compat'
  'qt6-charts'
  'qt6-declarative'
  'qt6-imageformats'
  'qt6-networkauth'
  'qt6-shadertools'
  'qt6-svg'
  'qt6-websockets'
  'wireguard-tools'
  'org.freedesktop.secrets'
)
makedepends=(
  'clang'
  'cmake'
  'flex'
  'go'
  'python-lxml'
  'python-yaml'
  'qt6-tools'
  'rust'
  'llvm-libs'
)
optdepends=(
  'qt6-wayland: for Wayland support'
)

install=mozillavpn.install

_debian_series="questing1"
_dl_url="https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn"
_pkgsrc="$pkgname-$pkgver"
source=(
  "$_dl_url/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz"
  "https://patch-diff.githubusercontent.com/raw/mozilla-mobile/mozilla-vpn-client/pull/10832.patch"
)
sha256sums=('8469d29a975d20864cfb18ff12173fe7de9bc5073aa834c3ce8208996669cc7f'
            '2bbfd19a27b6633cee05f3ace41f789ba7a41d971bb4a50db7b4edc0a0ea32b6')

_cargo_env() {
  : ${CARGO_HOME:=$SRCDEST/cargo-home}
  export CARGO_HOME
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  CFLAGS+=" -ffat-lto-objects"
}

prepare() {
  _cargo_env

  cd "$_pkgsrc"
  cargo update

  cd "extension/bridge"
  cargo update

  cd ../../
  patch -p1 < ../10832.patch
}

build() {
  _cargo_env

  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
