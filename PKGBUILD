#Maintainer: M0Rf30

pkgname=openbazaard
pkgver=0.1.3
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(
	gnupg
	python2-autobahn
	python2-bitcointools
	python2-bleach
	python2-gnupg-isis
	python2-libbitcoinclient
	python2-miniupnpc
	python2-protobuf3
	python2-pyelliptic
	python2-pynacl
	python2-pystun
	python2-python-bitcoinlib
	python2-requests
	python2-service-identity
	python2-twisted
	python2-txaio
	python2-txjson-rpc
	python2-txrestapi
	python2-txrudp
	python2-txws
)

makedepends=(git)
source=("https://github.com/OpenBazaar/OpenBazaar-Server/archive/v$pkgver.tar.gz"
	 ${pkgname}.service
	 ${pkgname}.conf
)
install=${pkgname}.install
options=('!strip')
provides=('openbazaard')
replaces=('openbazaard-git')
backup=('var/lib/openbazaard/ob.cfg '
	'etc/conf.d/openbazaard.conf')
_srcfolder=OpenBazaar-Server-$pkgver

package(){
  cd $srcdir/

  msg2 "Install systemd service"
  install -Dm644 $srcdir/${pkgname}.service $pkgdir/usr/lib/systemd/system/${pkgname}.service

  msg2 "Install conf file"
  install -Dm644 $srcdir/${pkgname}.conf $pkgdir/etc/conf.d/${pkgname}.conf

  install -dm755 $pkgdir/var/lib/

  cp -r ${_srcfolder} $pkgdir/var/lib/${pkgname}

  msg2 "Python2 bytecode generation"
  cd $pkgdir/var/lib/${pkgname}/ && python2 -m compileall .

  msg2 "Remove git folder"
  rm -rf $pkgdir/var/lib/${pkgname}/{.git*,.eslint*,.travis*}
}

md5sums=('7f3b12252f655680c3e2f015d15fd487'
         'df247302f02ad1af79e009fa75ced4bc'
         'd66496060ae2a28c6f755a1fb29e3f37')
