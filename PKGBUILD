#Maintainer: M0Rf30

pkgname=openbazaard-standalone
pkgver=0.2.1
pkgrel=3
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(python2)
makedepends=(python2-virtualenv ucl upx)
source=("https://github.com/OpenBazaar/OpenBazaar-Server/archive/v$pkgver.tar.gz"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.spec"
	requirements.txt
)
install=${pkgname}.install
options=('!strip')
provides=('openbazaard')
replaces=('openbazaard-git' 'openbazaard-standalone-git')
backup=("var/lib/${pkgname}/ob.cfg"
	"etc/conf.d/${pkgname}.conf")

_srcfolder=OpenBazaar-Server-$pkgver

package(){
  cd $srcdir/${_srcfolder}
  cp ../requirements.txt .
  cp ../${pkgname}.spec .

msg2 "Creating an optimized standalone executable"
  virtualenv2 env
  source env/bin/activate
  pip2 install -r requirements.txt
  pip2 install https://github.com/pyinstaller/pyinstaller/archive/master.zip
  pyinstaller -F ${pkgname}.spec

msg2 "Symlinking to allow gui to automatically call daemon"
  install -dm755 $pkgdir/opt
  ln -sr /var/lib/openbazaard $pkgdir/opt/OpenBazaar-Server

msg2 "Install systemd service"
  install -Dm644 $srcdir/${pkgname}.service $pkgdir/usr/lib/systemd/system/openbazaard.service

msg2 "Install conf file"
  install -Dm644 $srcdir/${pkgname}.conf $pkgdir/etc/conf.d/openbazaard.conf

msg2 "Install ${_pkgname} scripts"
  install -Dm755 dist/${pkgname} $pkgdir/var/lib/openbazaard/openbazaard
  install -Dm755 ob.cfg $pkgdir/var/lib/openbazaard/ob.cfg
}

md5sums=('cd20444eaf5b4068422f61db5856aea4'
         '58f846fbc1742fea9d245b6f93f6db15'
         '7949d40abcd8bdaee27ff670d5b6c1c7'
         'e4d7b1c3fdceca262a517dd103f59260'
         '83df086e201c60e2793180058bd7d1e9')
