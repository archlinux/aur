#Maintainer: M0Rf30

_pkgname=openbazaard-standalone
pkgname=${_pkgname}-git
pkgver=984.65e6618
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(python2)
makedepends=(git upx ucl python2-virtualenv)
source=("${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Server.git"
	 ${_pkgname}.conf
	 ${_pkgname}.service
	 ${_pkgname}.spec
)
install=${_pkgname}.install
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname} openbazaard)

package(){
  cd $srcdir/${_pkgname}
  cp ../${_pkgname}.spec .

msg2 "Creating an optimized standalone executable"
  virtualenv2 env
  source env/bin/activate
  pip2 install --upgrade -r requirements.txt
  pip2 install https://github.com/pyinstaller/pyinstaller/archive/develop.zip
  env/bin/pyinstaller -F ${_pkgname}.spec

msg2 "Symlinking to allow gui to automatically call daemon"
  install -dm755 $pkgdir/opt
  ln -sr /var/lib/openbazaard $pkgdir/opt/OpenBazaar-Server

msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/openbazaard.service

msg2 "Install conf file"
  install -Dm644 $srcdir/${_pkgname}.conf $pkgdir/etc/conf.d/openbazaard.conf


msg2 "Install ${_pkgname} scripts"
  install -Dm755 dist/${_pkgname} $pkgdir/var/lib/openbazaard/openbazaard
  install -Dm755 ob.cfg $pkgdir/var/lib/openbazaard/ob.cfg
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         'd66496060ae2a28c6f755a1fb29e3f37'
         '58f846fbc1742fea9d245b6f93f6db15'
         '6d5c84bead900b863b864f075bac98e4')
