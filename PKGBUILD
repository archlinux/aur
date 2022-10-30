# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>
pkgname=mozillavpn
pkgver=2.10.1
_debian_series=jammy1
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
sha256sums=('1479094c505469cad9c5a03b335d079774974c9007fc3ccbc0912e2a9884e6a1'
            '7bad4fa399c1092247a262e1efdcd6d3b57cea902949575ab2ace1d865903ea7')

build() {
    cd "${pkgname}-${pkgver}"
    rm -rf build && mkdir build && cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    
    # fix compiling with Qt >= 6.4
    patch src/connectionbenchmark/benchmarktaskdownload.cpp < ../issue_6676.patch
    
    cmake --build build -j6
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build
}
