# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: jhorcl
# Contributor: flbzh <frederic_lebouc (a) yahoo.fr>
pkgname=mozillavpn
pkgver=2.9.0
_debian_series=jammy1
pkgrel=2
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
         'hicolor-icon-theme'
         'wireguard-tools'
         'WIREGUARD-MODULE'
         'openresolv')
makedepends=('cmake' 'qt6-tools' 'go' 'flex' 'python-yaml' 'python-lxml' 'clang' 'cargo')
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages
source=("https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz" "issue_6676.patch")
sha256sums=('122b2e465da3dcbb226bde38413e7969b6128553999b1fc1ad59e1e3ace311ff'
            'fa8a2af04ec62109e38f019d6c013c369d5a017c3729ed487cea31fa181339f7')

build() {
    cd "${pkgname}-${pkgver}"
    rm -rf build && mkdir build && cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr
    
    # fix compiling with Qt >= 6.4
    patch src/connectionbenchmark/benchmarktaskdownload.cpp < ../issue_6676.patch
    
    cmake --build build -j6
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" cmake --install build
}
