# Maintainer: surefire <surefire@cryptomile.net>

_pkgname=ghetto-skype
pkgname=ghetto-skype-git
pkgver=1.4.1.r7.gdba086a
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
         'd64f8096b45034b1af93134cfdaaeece'
         'fd5e7e49294ee8dc3a171f882ce60a70')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "${pkgname}"

	sed -i \
		-e 's/skype24.png/skype.png/' \
		-e 's/skype24-1.png/skype-1.png/' \
	app/tray.js
}

build() {
	cd "${pkgname}"

	npm install --production

	asar p . ../ghetto-skype.asar
}

package() {

	install -Dm0755 -t "${pkgdir}/usr/bin" ghetto-skype
	install -Dm0644 -t "${pkgdir}/usr/share/applications" ghetto-skype.desktop
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgname}/LICENSE"

	install -Dm0644 -t "${pkgdir}/usr/lib/ghetto-skype" ghetto-skype.asar

	install -Dm0644 "${pkgname}/assets/tray/skype.png" "${pkgdir}/usr/share/pixmaps/ghetto-skype.png"

}
