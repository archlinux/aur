# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## links
# https://vpn.mozilla.org
# https://github.com/mozilla-mobile/mozilla-vpn-client
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages

pkgname=mozillavpn
pkgver=2.23.1
pkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
url="https://vpn.mozilla.org"
license=('MPL-2.0')
arch=('x86_64')

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
  'ninja'
  'python-lxml'
  'python-yaml'
  'qt6-tools'
  'rustup'
)
optdepends=(
  'qt6-wayland: for Wayland support'
)

install=mozillavpn.install

_commit_l10n="45def08c897e96ad92199910b41cc4884af35940"
_dl_url_l10n="https://github.com/mozilla-l10n/mozilla-vpn-client-l10n"
_pkgsrc_l10n="mozilla-vpn-client-l10n-$_commit_l10n"

_debian_series="noble1"
_pkgver_lp="2.23.0~rc20240626151300"
_dl_url_lp="https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn"
_pkgsrc_lp="$pkgname-$_pkgver_lp"

_dl_url_gh="https://github.com/mozilla-mobile/mozilla-vpn-client"
_pkgsrc="mozilla-vpn-client-$pkgver"

source=(
  "$pkgname-$pkgver.tar.gz"::"$_dl_url_gh/archive/refs/tags/v$pkgver.tar.gz"
  "$_dl_url_lp/${_pkgver_lp}-${_debian_series}/mozillavpn_${_pkgver_lp}.orig.tar.gz"
  "mozillavpn-l10n-${_commit_l10n::7}.tar.gz"::"$_dl_url_l10n/archive/$_commit_l10n.tar.gz"
)
sha256sums=(
  '1e22787bf636853c5fbb2f83ec06a06dee46500d433a72c3aac403ffee37abec'
  '7d96b6317a79e9315d02f41c41cf658d4237ba1aa73787c49f81a4d732e27fac'
  '82fe6a1b2a63aafc9e1ba1c376f3fdfbf65c16898c770433104e4aa330564b3a'
)

_cargo_env() {
  : ${CARGO_HOME:=$SRCDEST/cargo-home}
  export CARGO_HOME
  export RUSTUP_TOOLCHAIN=1.79
  export CARGO_TARGET_DIR=target

  CFLAGS+=" -ffat-lto-objects"
}

prepare() {
  cp --reflink=auto -an "$_pkgsrc_l10n"/* "$_pkgsrc/3rdparty/i18n/"
  rm -rf "$_pkgsrc_lp/3rdparty/i18n"
  cp --reflink=auto -an "$_pkgsrc_lp"/* "$_pkgsrc/"

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
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
