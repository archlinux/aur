#Maintainer: M0Rf30

_pkgname=openbazaard
pkgname=${_pkgname}-git
pkgver=799.3379a0b
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
source=("${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Server.git"
	 ${_pkgname}.service
	 ${_pkgname}.conf
)
install=${_pkgname}.install
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname})
backup=('var/lib/openbazaard/ob.cfg '
	'etc/conf.d/openbazaard.conf')

package(){
  cd $srcdir

  msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service

  msg2 "Install conf file"
  install -Dm644 $srcdir/${_pkgname}.conf $pkgdir/etc/conf.d/${_pkgname}.conf

  install -dm755 $pkgdir/var/lib/

  cp -r ${_pkgname} $pkgdir/var/lib/

  msg2 "Python2 bytecode generation"
  cd $pkgdir/var/lib/${_pkgname}/ && python2 -m compileall .

  msg2 "Remove git folder"
  rm -rf $pkgdir/var/lib/${_pkgname}/{.git*,.eslint*,.travis*}
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         'df247302f02ad1af79e009fa75ced4bc'
         'da0bca5d508ddd18227300090f09b8b9')
