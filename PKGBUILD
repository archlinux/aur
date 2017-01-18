# Maintainer: M0Rf30

_pkgname=openbazaar
pkgname=${_pkgname}-git
pkgver=v2.0.0.r12.g5a34124
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon (Latest devel version)" 
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
  npm install
  npm run build
  npm run sass:build process-index --parallel sass:watch index:watch browsersync
  rm -rf {.git*,.eslint*,.travis*}
# npm prune --production
  asar pack ../${_pkgname} ../${_pkgname}-next.asar
}

package(){
  cd $srcdir

msg2 "Installing Openbazaar data"
  install -Dm644 ${_pkgname}-next.asar $pkgdir/opt/${_pkgname}-next.asar

msg2 "Installing execution script"
  install -Dm755 ${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}-next

msg2 "Installing icons and desktop menu entry"
  install -Dm644 ${_pkgname}/imgs/icon.png "$pkgdir"/usr/share/pixmaps/${_pkgname}-next.png
  install -Dm644 ${_pkgname}.desktop "$pkgdir"/usr/share/applications/${_pkgname}-next.desktop
}

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
         'd7559b6a9a846fb6cad31dd69fe6f814'
         'c73725d3737122cca0197da8fedee48f')
