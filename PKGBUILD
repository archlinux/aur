# Maintainer: robertfoster

pkgname=openbazaar-git
pkgver=v2.3.0.rc3.r0.ga478dcda
pkgrel=1
pkgdesc="Front-end Electron application for talking with the OpenBazaar daemon (Latest devel version)"
arch=(any)
url="https://github.com/OpenBazaar/openbazaar-desktop"
license=('MIT')
depends=('electron2')
makedepends=('git' 'npm')
conflicts=('openbazaar')
source=("${pkgname%%-git}::git+https://github.com/OpenBazaar/openbazaar-desktop.git"
	"${pkgname%%-git}.js"
	"${pkgname%%-git}.desktop"
)
install=${pkgname%%-git}.install
options=('!strip')

build(){
	cd $srcdir/${pkgname%%-git}

	npm install --silent
	npm run build
}

package(){
	cd $srcdir
	appdir="usr/lib/${pkgname%%-git}"

	msg2 "Installing Openbazaar data"
	install -d $pkgdir/${appdir%%/${pkgname%%-git}}
	cp -rf ${pkgname%%-git} $pkgdir/$appdir

	msg2 "Installing execution script"
	install -Dm755 ${pkgname%%-git}.js $pkgdir/usr/bin/${pkgname%%-git}

	msg2 "Installing icons and desktop menu entry"
	install -Dm644 ${pkgname%%-git}/imgs/icon.png $pkgdir/usr/share/pixmaps/${pkgname%%-git}2.png
	install -Dm644 ${pkgname%%-git}.desktop $pkgdir/usr/share/applications/${pkgname%%-git}.desktop

	# Cleanup
	cd $pkgdir/$appdir
	rm -rf .git*
	rm -rf .travis
	cp -rf prod/* js/
	find "${pkgdir}"/${appdir} \
		-name "bin" -prune -exec rm -r '{}' \; \
		-or -name "example" -prune -exec rm -r '{}' \; \
		-or -name "examples" -prune -exec rm -r '{}' \; \
		-or -name "test" -prune -exec rm -r '{}' \;
}

pkgver() {
	cd $srcdir/${pkgname%%-git}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

md5sums=('SKIP'
         '6d2e87f99126f791e2ebd770c4b147de'
         'a278f17aa965510cadb534df49b245dd')
