# Maintainer: David Flemström <david.flemstrom@gmail.com>

pkgname=vpnc-fortigate
_svnrev=550
pkgver=0.5.3.svn${_svnrev}
pkgrel=1
pkgdesc="VPN client for cisco3000 VPN Concentrators, fixed for Fortigate"
url="http://www.unix-ag.uni-kl.de/~massar/vpnc/"
license=('GPL')
provides=('vpnc')
conflicts=('vpnc')
depends=('libgcrypt' 'openssl' 'iproute2')
makedepends=('subversion' 'git')
optdepends=('openresolv: Let vpnc manage resolv.conf')
arch=('i686' 'x86_64')
source=("vpnc::svn+http://svn.unix-ag.uni-kl.de/vpnc/trunk#revision=${_svnrev}"
        "vpnc-scripts::git://git.infradead.org/users/dwmw2/vpnc-scripts.git#commit=df5808b"
        'vpnc.conf'
        'vpnc@.service'
        'fortigate.patch')
backup=('etc/vpnc/default.conf')
md5sums=('SKIP'
         'SKIP'
         'a3f4e0cc682f437e310a1c86ae198e45'
         '09cfded435c43dd2adb5a8863bd74cfc'
         '377d5b4ca66e4bd6d931aa4feae8f310')

#pkgver() {
#  cd vpnc
#  _vpncver=$(cat VERSION)
#  _svnrev=$(svn info | awk '/^Revision:/ { print $2 }')
#  echo ${_vpncver}.svn${_svnrev}
#}

prepare() {
  # Build hybrid support
  sed -i 's|^#OPENSSL|OPENSSL|g' vpnc/Makefile

  # fix resolvconf location for community/openresolv
  sed -i 's|/sbin/resolvconf|/usr&|g' vpnc-scripts/vpnc-script

  # patch for Fortigate sending strange things
  patch -p1 -d vpnc < "$srcdir"/fortigate.patch
}

build() {
  cd vpnc
  make
}

package() {
  cd vpnc

  make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install

  install -Dm644 "$srcdir"/vpnc.conf "$pkgdir"/etc/vpnc/default.conf
  install -Dm755 "$srcdir"/vpnc-scripts/vpnc-script "$pkgdir"/etc/vpnc/vpnc-script

  install -Dm644 "$srcdir"/vpnc@.service "$pkgdir"/usr/lib/systemd/system/vpnc@.service
}
