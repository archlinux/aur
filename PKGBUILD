# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor Tavian Barnes <tavianator@tavianator.com>
# Contributor jhorcl
pkgname=mozillavpn
pkgver=2.5.0
_debian_series=hirsute2
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
         'qt5-charts'
         'qt5-declarative'
         'qt5-websockets'
         'qt5-graphicaleffects'
         'qt5-imageformats'
         'qt5-networkauth'
         'qt5-quickcontrols2'
         'qt5-svg'
         'hicolor-icon-theme'
         'wireguard-tools'
         'WIREGUARD-MODULE'
         'openresolv')
makedepends=('qt5-tools' 'go' 'flex' 'python-yaml')
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages
source=(
    "https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz"
    "https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}-${_debian_series}.debian.tar.xz"
    "libgo.patch")
sha256sums=('2549774bd742e08cdbe2177fe43f2ce514f2dd102b1c6f68e587ce1fdbc7a71a'
            '7a76fc487168bfde3b31361f380ca93feb59517e8f31c8153fa7fb67cfe37719'
            '3c5b7047481922a1b5c6673ae78750d1af8e9dbde85632804356c829dadfa301')

build() {
    cd "${pkgname}-${pkgver}"
    
    # https://github.com/mozilla-mobile/mozilla-vpn-client/pull/1490
    # https://github.com/mozilla-mobile/mozilla-vpn-client/issues/1814
    patch -Np1 -i "${srcdir}/libgo.patch" src/src.pro
    
    qmake PREFIX=/usr CONFIG+=production
    python scripts/importLanguages.py
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make INSTALL_ROOT="$pkgdir" install
    install -dm 755 "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "linux/mozillavpn.service" "$pkgdir/usr/lib/systemd/system"
}
