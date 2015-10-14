# New maintainer: mxtm <max@mxtm.me>
# Many, many thanks to former maintainer and author of original PKGBUILD, ronnie
pkgname=mullvad
pkgver=53
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('unknown')
depends=('openvpn' 'resolvconf' 'python2' 'python2-appdirs' 'gksu' 'wxpython' 'obfsproxy' 'python2-ipaddr' 'python2-netifaces')
makedepends=()
conflicts=()
replaces=()
backup=()
install=

source=('https://mullvad.net/static/download/mullvad_53-1_all.deb'
		'correct-python-version.patch'
		'update-resolv-conf'
)

sha256sums=('39423404f13a2f051a8255fb06e4cad6d442aef23dad4d4b71cd50fd2e15114d'
			'9c4c7a76bcc620cc50991eb1ec49483112b1003ed4f91c43460247603d49de60'
			'6597e59d556efa3fcec73e8b0ea1c8fbee927cef9a283dadfe0f11149e34ede2'
)

prepare() {
  cd $startdir/src/
  tar -xJf data.tar.xz

  patch -p1 < correct-python-version.patch

  mv usr/lib/python2.7/dist-packages usr/lib/python2.7/site-packages

  # From http://allanmcrae.com/2010/10/big-python-transition-in-arch-linux/
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find usr/ -name '*.py')
}

package() {
  cp -r usr/ $pkgdir

  mkdir -p $pkgdir/etc/openvpn
  cp update-resolv-conf $pkgdir/etc/openvpn/
  chmod +x $pkgdir/etc/openvpn/update-resolv-conf
}
