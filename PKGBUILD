#Maintainer: M0Rf30

_pkgname=openbazaard
pkgname=${_pkgname}-git
pkgver=544.645885f
pkgrel=1
pkgdesc="Server daemon for communication between client and OpenBazaar network"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(
	gnupg
)

makedepends=(git upx ucl python2-virtualenv)
source=("${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Server.git"
	 ${_pkgname}.service
	 ${_pkgname}.sh
)
install=${_pkgname}.install
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname})

package(){
  cd $srcdir/${_pkgname}
msg2 "Creating an optimized standalone executable"
  virtualenv2 env
  source env/bin/activate
  pip2 install -r requirements.txt
  pip2 install git+https://github.com/pyinstaller/pyinstaller.git
  env/bin/pyinstaller -F -n openbazaard  openbazaard.py
  
msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service
  
msg2 "Install ${_pkgname} scripts"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}
  install -Dm755 dist/${_pkgname} $pkgdir/var/lib/${_pkgname}/${_pkgname}
  install -Dm755 ob.cfg $pkgdir/var/lib/${_pkgname}/ob.cfg

}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '1bdae51331031c43d8ea6c4a8cb107d9'
         'faf204b62ca6d7126d96ea3fbdd8e600')
