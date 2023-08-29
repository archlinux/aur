# Maintainer: Utsav <aur (a) utsav2 [.] dev>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>
# Contributor: Rafał Wyszomirski <m6vuthzbw at mozmail dot com>

pkgname=mozillavpn
pkgver=2.16.1
pkgrel=1
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('x86_64')
url="https://mozilla.org/products/vpn"
license=('MPL2')
# See issue: https://github.com/briansmith/ring/issues/1444
options=('!lto')
depends=('polkit'
         'libxcb'
         'libxmu'
         'libxrender'
         'libtiff'
         'libxdmcp'
         'dbus'
         'freetype2'
         'qt6-charts'
         'qt6-declarative'
         'qt6-websockets'
         'qt6-imageformats'
         'qt6-networkauth'
         'qt6-svg'
         'qt6-5compat'
         'qt6-shadertools'
         'hicolor-icon-theme'
         'wireguard-tools')
makedepends=('git'
             'cmake'
             'qt6-tools'
             'go'
             'clang'
             'cargo'
             'python-yaml'
             'python-lxml'
             'python-glean-parser'
             'yamllint')
optdepends=('qt6-wayland: for Wayland support'
            'openresolv: for resolv.conf management')
# https://github.com/mozilla-mobile/mozilla-vpn-client
source=(${pkgname}-v${pkgver}::git+https://github.com/mozilla-mobile/mozilla-vpn-client.git#tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
    cd ${pkgname}-v${pkgver}
    mkdir -p build

    git submodule init
    git submodule update
}

build() {
    cd ${pkgname}-v${pkgver}

    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd ${pkgname}-v${pkgver}
    DESTDIR="$pkgdir" cmake --install build
}
