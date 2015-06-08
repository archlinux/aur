# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Kessia 'even' Pinheiro <kessiapinheiro at gmail.com>
# Contributor: Sorin Ionescu <sorin.ionescu@gmail.com>

pkgname=ufw-bzr
_pkgname=ufw
pkgver=865
pkgrel=1
pkgdesc="Uncomplicated and easy to use CLI tool for managing a netfilter firewall. Development branch."
arch=('any')
url="https://code.launchpad.net/~jdstrand/ufw/trunk"
license=('GPL3')
depends=('iptables' 'python2')
makedepends=('bzr')
provides=('ufw')
conflicts=('ufw')
backup=('etc/ufw/before.rules'
'etc/ufw/before6.rules'
'etc/ufw/after.rules'
'etc/ufw/after6.rules'
'etc/ufw/ufw.conf'
'etc/ufw/user.rules'
'etc/ufw/sysctl.conf'
'etc/default/ufw'
'usr/lib/ufw/user.rules'
'usr/lib/ufw/user6.rules')
source=("$_pkgname::bzr+http://bazaar.launchpad.net/~jdstrand/$_pkgname/trunk/"
"$_pkgname.service")
sha256sums=('SKIP'
            'fdface6f4690e4748fbbd5661c02e1967a8750fdb23581d35516174017a3fe39')

pkgver() {
  cd "$_pkgname"
  bzr revno
}

prepare() {
  cd "$_pkgname"

	# FS#28769 - move from /lib to /usr/lib
  sed -e 's|/lib|/usr/lib|' -i setup.py
}

package() {
  cd "$_pkgname"
  python2 setup.py install --root=$pkgdir
	
	# FS#35458 - correct iptables location
  sed -e 's|sbin|bin|g' -i $pkgdir/usr/lib/python2.7/site-packages/ufw/*
	
	install -Dm644 $srcdir/$_pkgname.service $pkgdir/usr/lib/systemd/system/$_pkgname.service
  chmod 644 $pkgdir/etc/ufw/*.rules $pkgdir/usr/lib/ufw/*.rules
  
	install -Dm755 $pkgdir/usr/sbin/$_pkgname $pkgdir/usr/bin/$_pkgname
	rm -rf $pkgdir/usr/sbin
}
