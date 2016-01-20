#Maintainer: M0Rf30

_pkgname=openbazaar
pkgname=${_pkgname}-git
pkgver=1399.fd0e7fa
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron openbazaard-git)
makedepends=(git npm)
source=(
	"${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar-Client.git"
	"${_pkgname}.sh"
        "${_pkgname}.desktop"
        "${_pkgname}.png"
	patch
)
install=${_pkgname}.install
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname})

build(){
  cd $srcdir/${_pkgname}
  patch -Np1 -i ../patch
  npm install
}

package(){

msg2 "Installing Openbazaar data"
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/${_pkgname} $pkgdir/opt/

msg2 "Symlinking to allow gui to automatically call daemon"
  ln -sr /var/lib/openbazaard $pkgdir/opt/${_pkgname}/OpenBazaar-Server  
 
msg2 "Installing execution script"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}
  

  rm -rf $pkgdir/opt/${_pkgname}/{.git*,.eslint*,.travis*}

msg2 "Installing icons and desktop menu entry"
  install -Dm644 $srcdir/${_pkgname}.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/openbazaar.png
  install -Dm644 $srcdir/${_pkgname}.desktop "$pkgdir"/usr/share/applications/openbazaar.desktop
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '2f915aa854435ce7cd1dfca4eccd0112'
         'a528a6284cbdf4e901af319ca3bb68d9'
         '71fc6ef0cc128dc1d00eff33c12c66cb'
         'b87e42ca176fcaf4f96ea1dcf353c6f9')
