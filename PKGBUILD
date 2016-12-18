# Maintainer: surefire <surefire@cryptomile.net>

pkgname=ghetto-skype-git
pkgver=1.5.0.r1.g12e2014
pkgrel=1
pkgdesc="Are you tired of a buggy 32 bit official Skype client? Then Ghetto Skype is for you!"
arch=("any")
url="https://github.com/stanfieldr/ghetto-skype"
license=("GPLv3")
depends=('electron')
makedepends=('npm' 'asar')
conflicts=('ghetto-skype')
provides=('ghetto-skype')
options=(!emptydirs)
source=("${pkgname}::git+https://github.com/stanfieldr/ghetto-skype.git"
        'ghetto-skype.desktop'
        'ghetto-skype')
md5sums=('SKIP'
         '44aa5d2772bedba2598dbd46b0b0b4f4'
         'fd5e7e49294ee8dc3a171f882ce60a70')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "${pkgname}"

	sed -i src/tray.js \
		-e 's/skype24.png/skype.png/' \
		-e 's/skype24-1.png/skype-1.png/' \
	;
}

build() {
	cd "${pkgname}/src"

	npm install --production

	asar p . ../../ghetto-skype.asar
}

package() {

	install -Dm0755 -t "${pkgdir}/usr/bin" ghetto-skype
	install -Dm0644 -t "${pkgdir}/usr/share/applications" ghetto-skype.desktop
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/ghetto-skype" "${pkgname}/LICENSE"

	install -Dm0644 -t "${pkgdir}/usr/lib/ghetto-skype" ghetto-skype.asar

	install -Dm0644 "${pkgname}/src/assets/tray/skype.png" "${pkgdir}/usr/share/pixmaps/ghetto-skype.png"

}
