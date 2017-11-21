# Maintainer: robertfoster

_pkgname=openbazaar
pkgname=${_pkgname}-git
pkgver=v2.0.17.r44.g4e26c5c3
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon (Latest devel version)" 
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(electron)
makedepends=(git npm)
conflicts=('openbazaar')
source=(
	"${_pkgname}::git+https://github.com/OpenBazaar/openbazaar-desktop.git"
	"${_pkgname}.js"
    "${_pkgname}.desktop"
)
install=${_pkgname}.install
options=('!strip')

build(){
  cd $srcdir/${_pkgname}
  npm install
  npm run build
  rm -rf {.eslint*,.travis*}
  cp -rf prod/* js/
  npm prune --production
}

package(){
  cd $srcdir
	appdir=/usr/lib/

	msg2 "Installing Openbazaar data"
	install -d $pkgdir/$appdir
	cp -r ${_pkgname} $pkgdir/$appdir${_pkgname}

	msg2 "Installing execution script"
	install -Dm755 ${_pkgname}.js $pkgdir/usr/bin/${_pkgname}

	msg2 "Installing icons and desktop menu entry"
	install -Dm644 ${_pkgname}/imgs/icon.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
	install -Dm644 ${_pkgname}.desktop "$pkgdir"/usr/share/applications/${_pkgname}.desktop
}

pkgver() {
  cd $srcdir/${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
         '446ad1e41acd07468c3750a9027dc8f8'
         '43c9c9ef1d3ca873eea6b6343ca072e8')
