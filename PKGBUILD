# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## links
# https://vpn.mozilla.org
# https://github.com/mozilla-mobile/mozilla-vpn-client
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages

pkgname=mozillavpn
pkgver=2.36.0
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
  'wayland-protocols: for Wayland support'
)

install=mozillavpn.install

_debian_series="questing1"
_dl_url="https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn"
_pkgsrc="$pkgname-$pkgver"
source=(
  "$_dl_url/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz"
)
sha256sums=('ebb339a2e597a3e31fadf9cd6da08431b28b96d560d6721879aa3ff7283cf446')

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
  install -Dm644 "$srcdir/$_pkgsrc/linux/org.mozilla.vpn.rules-others" "$pkgdir/usr/share/polkit-1/rules.d/org.mozilla.vpn.rules"
}
