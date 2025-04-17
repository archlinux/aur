# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## links
# https://vpn.mozilla.org
# https://github.com/mozilla-mobile/mozilla-vpn-client
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages

pkgname=mozillavpn
pkgver=2.27.0
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
  'rust'
)
optdepends=(
    'qt6-wayland: for Wayland support'
)

install=mozillavpn.install

_debian_series="plucky1"
_dl_url="https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn"
_pkgsrc="$pkgname-$pkgver"
source=(
  "$_dl_url/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz"
  "10420.patch::https://patch-diff.githubusercontent.com/raw/mozilla-mobile/mozilla-vpn-client/pull/10420.patch"
  "10424.patch::https://patch-diff.githubusercontent.com/raw/mozilla-mobile/mozilla-vpn-client/pull/10424.patch"
  "10422.patch::https://patch-diff.githubusercontent.com/raw/mozilla-mobile/mozilla-vpn-client/pull/10422.patch"
  "10425.patch::https://patch-diff.githubusercontent.com/raw/mozilla-mobile/mozilla-vpn-client/pull/10425.patch"
)
sha256sums=('8dc298e53052b10e7ccf263e256542a5fd7cea3ecd22cf2827a371e4f22cfd88'
            '241b61fa34420438e8c7bce932c6bd7cddb310a327e5cb835d204447e4b6db8e'
            '3e21f2cb66ddc89bb89a0a0df23bed49eff8ea9d1cbf0eeb02a8a9b50836e1f6'
            '572d8792a1cab0805b4e2f1a95595936b112aa76904cc7429746ca4d939438fd'
            '9f60250e50a1a07a5f80d40d4c1f020868782ce6aed8d3673beb48e841f1ebc5')

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

  # fix build with Qt6.9
  patch -p1 < ../10420.patch
  patch -p1 < ../10424.patch
  patch -p1 < ../10422.patch
  patch -p1 < ../10425.patch

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
