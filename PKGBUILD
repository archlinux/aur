# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor Tavian Barnes <tavianator@tavianator.com>
# Contributor jhorcl
pkgname=mozillavpn
pkgver=2.7.0
_debian_series=impish1
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
    "https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}-${_debian_series}.debian.tar.xz")
sha256sums=('0aca5cc0752d30b7b120d8cf277cac6ef4e085db5f9d68fec3450030b0b1215b'
            '064e87240c6807aecfee3e22c3510d7ceb49c4f969ed041458dca6cce6ccf060')

build() {
    cd "${pkgname}-${pkgver}"
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
