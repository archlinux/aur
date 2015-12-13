#Maintainer: M0Rf30

_pkgname=openbazaar-server
pkgname=${_pkgname}-git
pkgver=526.1d28f56
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(
	gnupg
	python2-autobahn
	python2-bitcoin
	python2-gnupg-isis
	python2-libbitcoinclient
	python2-libnacl-git
	python2-protobuf
	python2-pyelliptic
	python2-pystun
	python2-requests
	python2-service-identity
	python2-twisted
	python2-txaio
	python2-txjson-rpc
	python2-txrestapi
	python2-txrudp
)

makedepends=(git)
source=("${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Server.git"
	 ${_pkgname}.service
	 ${_pkgname}.sh
)
install=${_pkgname}.install
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname})

package(){
  cd $srcdir

  msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service

  msg2 "Install ${_pkgname} scripts"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}

  install -dm755 $pkgdir/var/lib/

  cp -r ${_pkgname} $pkgdir/var/lib/

  msg2 "Python2 bytecode generation"
  cd $pkgdir/var/lib/${_pkgname}/ && python2 -m compileall .

  msg2 "Remove git folder"
  rm -rf $pkgdir/var/lib/${_pkgname}/.git
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '884b0f2fa1458ab997f8fc6a8bd1f563'
         '6e8afd740cdec723fbf6eda0f3626397')
