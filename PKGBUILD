#Maintainer: M0Rf30

_pkgname=openbazaar
pkgname=${_pkgname}-git
pkgver=338.88adef7
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(git npm asar)
source=(
	"${_pkgname}::git+https://github.com/OpenBazaar/openbazaar-desktop.git"
	"${_pkgname}.sh"
        "${_pkgname}.desktop"
)
install=${_pkgname}.install
options=('!strip')
provides=('openbazaar')
conflicts=('openbazaar')

build(){
  cd $srcdir/${_pkgname}
# npm install --production
  npm install
  npm run babel
  npm run sass:build 
  npm run process-index
  asar pack ../${_pkgname} ../${_pkgname}.asar
}

package(){

msg2 "Installing Openbazaar data"
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/${_pkgname}.asar $pkgdir/opt/

msg2 "Installing execution script"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}

msg2 "Installing icons and desktop menu entry"
  install -Dm644 $srcdir/${_pkgname}/imgs/icon.png "$pkgdir"/usr/share/pixmaps/openbazaar.png
  install -Dm644 $srcdir/${_pkgname}.desktop "$pkgdir"/usr/share/applications/openbazaar.desktop
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '978f2bc37d379c6ccd8c5942ef44612c'
         'dbca9273e9fc18a7aa5d1c395508fe60')
