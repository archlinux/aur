# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## webpage
# https://vpn.mozilla.org

pkgname=mozillavpn
pkgver=2.37.0
pkgrel=2
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
arch=('x86_64')
url="https://github.com/mozilla-mobile/mozilla-vpn-client"
license=('MPL-2.0')
depends=(
  'hicolor-icon-theme'
  'libsecret'
  'polkit'
  'qt6-5compat'
  'qt6-declarative'
  'qt6-networkauth'
  'qt6-svg'
  'qt6-websockets'
  'wireguard-tools'
)
makedepends=(
  'rust'
  'go'
  'ninja'
  'python-click'
  'python-jinja'
  'python-jsonschema'
  'python-yaml'
  'qt6-tools'
)
optdepends=(
  'qt6-wayland: for Wayland support'
  'wayland-protocols: for Wayland support'
)
install=mozillavpn.install
options=('!lto')

_pkgsrc="${pkgname}"
source=("${_pkgsrc}"::"git+${url}.git#tag=v${pkgver}")
sha256sums=('8f1fe6874197da9a681136e186ac0820b2687ff54aa111e658cb5afbe9ec0679')

prepare() {
  cd "${_pkgsrc}"
  git submodule update --init --recursive --depth=1
}

build() {
  local _cmake_options=(
    -S "${_pkgsrc}"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
  )
  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${srcdir}/${_pkgsrc}/linux/org.mozilla.vpn.rules-others" "${pkgdir}/usr/share/polkit-1/rules.d/org.mozilla.vpn.rules"
}
