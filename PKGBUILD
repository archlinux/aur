#Maintainer: M0Rf30

_pkgname=openbazaar
pkgname=${_pkgname}-hoffmabc-git
pkgver=3984.fc90dff
pkgrel=1
pkgdesc="A decentralized marketplace proof of concept. It is based off of the POC code by the darkmarket team and protected by the GPL"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(curl gnupg1 jquery
            python2-bitcoin
            python2-dnschain
            python2-gnupg
            python2-ipy
            python2-miniupnpc
            python2-obelisk
            python2-pillow
            python2-psutil
            python2-pycountry
            python2-pyee
            python2-pyelliptic
            python2-pysqlcipher
            python2-pystun
            python2-qrcode
            python2-requests
            python2-rfc3986
            python2-tornado
)

makedepends=(git)
optdepends=('pybitmessage: Send and receive messages to anyone on the bitmessage network')
source=("${_pkgname}::git+https://github.com/hoffmabc/OpenBazaar#branch=feature-0.4-fixes"
	 ${_pkgname}.service
	 ${_pkgname}.sh
	 ${_pkgname}-stop.sh
	gnupg1.patch
)

install=${_pkgname}.install
options=('!strip')
conflicts=(${_pkgname} ${_pkgname}-git)

package(){
  cd $srcdir/${_pkgname}

  msg2 "Patch against Gnupg2"
  patch -Np1 -i ../gnupg1.patch

  sed -i "s/import node.network_util as network_util/from node import network_util, setup_db, util/g" node/openbazaar.py
  
  msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service

  msg2 "Install ${_pkgname} scripts"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}
  install -Dm755 $srcdir/${_pkgname}-stop.sh $pkgdir/usr/bin/${_pkgname}-stop

  msg2 "Create folder for user ${_pkgname}"
  cd installers/ubuntu
  cat build | head -n -2 > create_folders
  python2 create_folders
  cp -r output/usr/share $pkgdir/usr/
  install -dm755 $pkgdir/var/lib/
  mv $pkgdir/usr/share/${_pkgname} $pkgdir/var/lib/
  cp -r $srcdir/${_pkgname}/rudp $pkgdir/var/lib/${_pkgname}

  
  msg2 "Jquery symlink"
  ln -s -r /usr/share/jquery/jquery.min.js $pkgdir/var/lib/${_pkgname}/html/vendors/

  msg2 "Python2 bytecode generation"
  cd $pkgdir/var/lib/${_pkgname}/ && python2 -m compileall .
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '3aa1c8dc7384d62ffdb404e973afc1f3'
         '85569b5ec72425e081d4bb35806daa00'
         '97eb92b231bf82e033926e5d350eb3be'
         'c16bf5d35cc3a8d2839e4bd153f15d6e')
