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

build(){
  cd $srcdir/${_pkgname}
#  npm install --production
  npm install
  npm run build
  rm -rf {.git*,.eslint*,.travis*}
  npm prune --production
  asar pack ../${_pkgname} ../${_pkgname}-next.asar
}

package(){

msg2 "Installing Openbazaar data"
  install -dm755 $pkgdir/opt/
  cp -r $srcdir/${_pkgname}-next.asar $pkgdir/opt/

msg2 "Installing execution script"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}-next

msg2 "Installing icons and desktop menu entry"
  install -Dm644 $srcdir/${_pkgname}/imgs/icon.png "$pkgdir"/usr/share/pixmaps/${_pkgname}-next.png
  install -Dm644 $srcdir/${_pkgname}.desktop "$pkgdir"/usr/share/applications/${_pkgname}-next.desktop
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '33bdb461a15ea719be2bf41caa9d72d5'
         'd7394c8c503c5c930a7d3ceb005a2d3d')
