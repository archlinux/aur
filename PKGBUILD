# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>
pkgname=mozillavpn
pkgver=2.11.0
_debian_series=kinetic1
pkgrel=1
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('i686' 'x86_64')
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
makedepends=('cmake' 'qt6-tools' 'go' 'flex' 'python-yaml' 'python-lxml' 'clang' 'cargo')
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages
source=("https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz" "issue_6676.patch")
sha256sums=('9f26fd7da7e486798fafa01657d346d163534edbb33e5096aef4559d5dd6959f'
            '1d2dc2b0be6e482aaf2eb820024f53634395d1d94e0eb3add81cdc0e64dc5152')

build() {
    cd "${pkgname}-${pkgver}"
    rm -rf build && mkdir build && cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    
    # fix compiling with Qt >= 6.4
    patch -p0 < ../issue_6676.patch
    
    cmake --build build -j6
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build
}
