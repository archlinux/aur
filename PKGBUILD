# New maintainer: mxtm <max@mxtm.me>
# Many, many thanks to former maintainer and author of original PKGBUILD, ronnie
pkgname=mullvad
pkgver=51
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('unknown')
depends=('openvpn' 'resolvconf' 'python2' 'python2-appdirs' 'gksu' 'wxpython2.8')
makedepends=()
conflicts=()
replaces=()
backup=()
install=

source=('https://mullvad.net/static/download/mullvad_51-1_all.deb'
		'correct-python-version.patch'
		'wx-version-fix.patch'
		'update-resolv-conf'
)

sha256sums=('d58e7b8764210b40e7f610532f5b7ded9ab58dae004b8579b3983d8ea31878cf'
			'ad7b44f604338254da276b0419e5be63188824c38d3fe934028f9e97755de9c5'
			'75d41450b3eab74f797674db3c04b0e7895741879a7e193e6aa23e983bd1dbc8'
			'6597e59d556efa3fcec73e8b0ea1c8fbee927cef9a283dadfe0f11149e34ede2'
)

prepare() {
  cd $startdir/src/
  tar -xJf data.tar.xz

  patch -p1 < correct-python-version.patch
  patch -p1 < wx-version-fix.patch

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
