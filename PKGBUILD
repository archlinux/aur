# $Id$
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Daniel Balieiro <daniel@balieiro.com>
# Contributor: Rodrigo L. M. Flores <mail@rodrigoflores.org>
# Contributor: K900 <me@0upti.me>
# Original patch by Leonid Evdokimov
# https://launchpad.net/~darkk/+archive/ubuntu/cisco-gabble
_pkgname=telepathy-gabble
pkgname=$_pkgname-cisco
pkgver=0.18.3
pkgrel=1
pkgdesc="A Jabber/XMPP connection manager for Telepathy, patched to connect to Cisco Jabber servers"
arch=('i686' 'x86_64')
url="http://telepathy.freedesktop.org"
groups=('telepathy')
license=('LGPL2.1')
depends=('telepathy-glib' 'libsoup' 'libnice' 'sqlite')
makedepends=('libxslt' 'python2')
options=('!emptydirs')
source=(
  http://telepathy.freedesktop.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz
  cisco-jabber-workaround.patch
)
install=telepathy-gabble.install
md5sums=('40f2fbabc4e6e147258c83ed697f2fcf'
         '23b47ce24f3701133cf806c06d73e79d')

provides=('telepathy-gabble')
conflicts=('telepathy-gabble')

build() {
  cd $_pkgname-$pkgver

  patch -p1 -i $srcdir/cisco-jabber-workaround.patch

  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
  	--libexecdir=/usr/lib/telepathy --with-tls=openssl
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  sed -i "s|#!/usr/bin/env python|#!/usr/bin/env python2|" "$pkgdir/usr/bin/telepathy-gabble-xmpp-console"
}
