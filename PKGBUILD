# Maintainer: ronnie
pkgname=mullvad
pkgver=46
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('unknown')
depends=(openvpn resolvconf python2 gksu wxpython2.8)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(https://www.mullvad.net/static/download/${pkgname}_${pkgver}_all.deb
        up-down.patch
        mullvad-wxpython.patch
        )

sha256sums=('1753f34f58409df4dffa465d3cd56ec19314c744907907c1abd640912f03611a'
        'b2b8d285eb1c3fbaea2cf81417f79dbe9e7ebf9d42c29412283549daedc962a0'
        'b2923c97cf942baa49bf0cca589a54142f9653fec9ee0d73b87695fbc90563f3'
)
package() {
  cd $startdir/src/
  tar xzvf data.tar.gz
  patch -p0 < up-down.patch
  patch -p0 < mullvad-wxpython.patch

  # From http://allanmcrae.com/2010/10/big-python-transition-in-arch-linux/
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find usr/ -name '*.py')
  echo $pkgdir
  cp -r usr/ $pkgdir
  mkdir -p $pkgdir/etc/openvpn
  cp /usr/share/openvpn/contrib/pull-resolv-conf/client.up    $pkgdir/etc/openvpn/mullvad-up-resolv-conf
  cp /usr/share/openvpn/contrib/pull-resolv-conf/client.down  $pkgdir/etc/openvpn/mullvad-down-resolv-conf
  chmod +x $pkgdir/etc/openvpn/mullvad-{up,down}-resolv-conf
}
