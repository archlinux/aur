#Maintainer: M0Rf30

pkgname=openbazaard-standalone
pkgver=0.2.6
pkgrel=3
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(python2)
makedepends=(python2-virtualenv ucl upx tk)
source=("https://github.com/OpenBazaar/OpenBazaar-Server/archive/v$pkgver.tar.gz"
	"${pkgname}.service"
	"${pkgname}.conf"
	"${pkgname}.spec"
	requirements.txt
	b5e6d38160d41b9155d5b6bec8b5e2cee4ce77d1.patch
)
install=${pkgname}.install
options=('!strip')
conflicts=('openbazaard')
provides=('openbazaard')
replaces=('openbazaard' 'openbazaard-standalone-git')
backup=("var/lib/${pkgname}/ob.cfg"
	"etc/conf.d/${pkgname}.conf")

_srcfolder=OpenBazaar-Server-$pkgver

package(){
  cd $srcdir/${_srcfolder}
  patch -Np1 -i ../b5e6d38160d41b9155d5b6bec8b5e2cee4ce77d1.patch
  cp ../requirements.txt .
  cp ../${pkgname}.spec .



msg2 "Creating an optimized standalone executable..."
  virtualenv2 env
  
msg2 "Fix for zope.interface..."
  mkdir -p env/lib/python2.7/site-packages/zope
  touch env/lib/python2.7/site-packages/zope/__init__.py

msg2 "Activating virtualenv2..."  
  source env/bin/activate
  pip2 install -r requirements.txt
  pip2 install https://github.com/pyinstaller/pyinstaller/archive/master.zip
  pyinstaller -F ${pkgname}.spec --exclude-module tkinter

msg2 "Symlinking to allow gui to automatically call daemon..."
  install -dm755 $pkgdir/opt
  ln -sr /var/lib/openbazaard $pkgdir/opt/OpenBazaar-Server

msg2 "Installing systemd service..."
  install -Dm644 $srcdir/${pkgname}.service $pkgdir/usr/lib/systemd/system/openbazaard.service

msg2 "Installing conf file..."
  install -Dm644 $srcdir/${pkgname}.conf $pkgdir/etc/conf.d/openbazaard.conf

msg2 "Install ${_pkgname} scripts"
  install -Dm755 dist/${pkgname} $pkgdir/var/lib/openbazaard/openbazaard
  install -Dm755 ob.cfg $pkgdir/var/lib/openbazaard/ob.cfg
}

md5sums=('ebf7299e9d83069f9d6037df98047c56'
         '58f846fbc1742fea9d245b6f93f6db15'
         '7949d40abcd8bdaee27ff670d5b6c1c7'
         'e4d7b1c3fdceca262a517dd103f59260'
         '46ec3bbe265a469e7e6159f8a9a4486e'
         '76c3727be7a8f1eb2a7c5e1dda7e8649')
