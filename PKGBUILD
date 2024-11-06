# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## links
# https://vpn.mozilla.org
# https://github.com/mozilla-mobile/mozilla-vpn-client
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages

pkgname=mozillavpn
pkgver=2.24.3
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
)
makedepends=(
  'clang'
  'cmake'
  'flex'
  'go'
  'python-lxml'
  'python-yaml'
  'qt6-tools'
  'rustup'
)
optdepends=(
    'qt6-wayland: for Wayland support'
)

install=mozillavpn.install

_debian_series="oracular1"
_dl_url="https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn"
_pkgsrc="$pkgname-$pkgver"
source=("$_dl_url/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz"
        "https://github.com/mozilla-mobile/mozilla-vpn-client/pull/9961.patch"
        "qt68fixes.patch")
sha256sums=('f0f69f6aff6d7184d5fb8234599f3133bbade462e83ab922d48a752db5d9cec9'
            '02285c79a50e67c28ad279be916419f0164a8efe1b2385befd18b90af92478e9'
            '64bdd0a78dc284e12777c97eb0cbc86085ea22b5c0359aea03702956d3efbcd9')

_cargo_env() {
  : ${CARGO_HOME:=$SRCDEST/cargo-home}
  export CARGO_HOME
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  CFLAGS+=" -ffat-lto-objects"
}

prepare() {
  patch -d $_pkgsrc -p1 < 9961.patch # https://github.com/mozilla-mobile/mozilla-vpn-client/pull/9961
  patch -d $_pkgsrc -p1 < qt68fixes.patch # https://github.com/mozilla-mobile/mozilla-vpn-client/commit/485a2ad8feab6b1dee7c672ce03736d819fd9d37

  _cargo_env

  cd "$_pkgsrc"
  cargo update

  cd "extension/bridge"
  cargo update
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
