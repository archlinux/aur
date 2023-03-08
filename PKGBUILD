# Maintainer: Utsav <aur at utsav2 dot dev>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>

pkgname=mozillavpn
pkgver=2.13.1
pkgrel=1
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('x86_64')
url="https://vpn.mozilla.org/"
license=('GPL')
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
         'wireguard-tools'
         'WIREGUARD-MODULE'
         'openresolv')
makedepends=('cmake' 'qt6-tools' 'go' 'flex' 'python-yaml' 'python-lxml' 'clang' 'cargo' 'python-pip')
# https://github.com/mozilla-mobile/mozilla-vpn-client
source=(mozillavpn-v${pkgver}::git+https://github.com/mozilla-mobile/mozilla-vpn-client.git#tag=v${pkgver})

sha256sums=(SKIP)

prepare() {
    cd mozillavpn-v${pkgver}
        
    rm -rf build
    mkdir build

    git submodule init
    git submodule update
}

build() {
    cd mozillavpn-v${pkgver}

    pip install --user glean_parser

    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j$(nproc)
}

package() {
    cd mozillavpn-v${pkgver}
    DESTDIR="$pkgdir" cmake --install build
}
