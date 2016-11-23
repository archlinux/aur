#Maintainer: M0Rf30

_pkgname=openbazaard-standalone
pkgname=${_pkgname}-git
pkgver=1143.72445ef
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network (Latest git for 1.x standalone)"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(python2)
makedepends=(git upx ucl python2-virtualenv)
source=("${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Server.git"
	 ${_pkgname}.conf
	 ${_pkgname}.service
	 ${_pkgname}.spec
	 requirements.txt
)
install=${_pkgname}.install
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname} openbazaard)

package(){
  cd $srcdir/${_pkgname}
  cp ../${_pkgname}.spec .
  cp ../requirements.txt .

msg2 "Creating an optimized standalone executable..."
  virtualenv2 env
  
msg2 "Fix for zope.interface..."
  mkdir -p env/lib/python2.7/site-packages/zope
  touch env/lib/python2.7/site-packages/zope/__init__.py

msg2 "Activating virtualenv2..."  
  source env/bin/activate
  pip2 install -r requirements.txt
  pip2 install https://github.com/pyinstaller/pyinstaller/archive/master.zip
  pyinstaller -F ${_pkgname}.spec

msg2 "Symlinking to allow gui to automatically call daemon..."
  install -dm755 $pkgdir/opt
  ln -sr /var/lib/openbazaard $pkgdir/opt/OpenBazaar-Server

msg2 "Installing systemd service..."
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/openbazaard.service

msg2 "Installing conf file..."
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
         '7949d40abcd8bdaee27ff670d5b6c1c7'
         '58f846fbc1742fea9d245b6f93f6db15'
         'e4d7b1c3fdceca262a517dd103f59260'
         '6e5acb7867aee15e2b949a554836c2c9')
