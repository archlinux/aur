# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Utsav <aur (a) utsav2 [.] dev>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

## webpage
# https://vpn.mozilla.org

pkgname=mozillavpn
pkgver=2.39.0
pkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
arch=('x86_64')
url="https://github.com/mozilla-mobile/mozilla-vpn-client"
license=('MPL-2.0')
depends=(
  'hicolor-icon-theme'
  'org.freedesktop.secrets'
  'polkit'
  'qt6-5compat'
  'qt6-declarative'
  'qt6-networkauth'
  'qt6-svg'
  'qt6-websockets'
  'wireguard-tools'
)
makedepends=(
  'cargo'
  'cmake'
  'go'
  'ninja'
  'python-yaml'
  'qt6-tools'
)
optdepends=(
  'qt6-wayland: for Wayland support'
  'wayland-protocols: for Wayland support'
)
install=mozillavpn.install
options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz::https://archive.mozilla.org/pub/vpn/releases/${pkgver}/source/mozillavpn-sources.tar.gz")
sha256sums=('4a634b695dacc11ef9cfa2f530fa17eabb2c9599dc26e9f234a34bb334fd5f99')

prepare() {
  tar xf *.orig.tar.gz
  mv mozillavpn-*/ "${pkgname}"
}

build() {
  local _cmake_options=(
    -S "${srcdir}/${pkgname}"
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
  install -Dm644 "${srcdir}/${pkgname}/linux/org.mozilla.vpn.rules-others" "${pkgdir}/usr/share/polkit-1/rules.d/org.mozilla.vpn.rules"
}
