# Maintainer: surefire <surefire@cryptomile.net>

pkgname=ghetto-skype-git
pkgver=1.6.0+7+g5ae7d28
pkgrel=1
pkgdesc="This is an electron client that uses Web Skype to better integrate with desktop environments found on Linux."
arch=("x86_64")
url="https://github.com/stanfieldr/ghetto-skype"
license=("GPL3")
depends=('electron')
makedepends=(
	'asar'
	'gcc'
	'npm'
	'pkgconf'
)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
options=(!emptydirs)
source=("$pkgname::git+$url.git"
        'ghetto-skype.desktop'
        'ghetto-skype')
md5sums=('SKIP'
         '44aa5d2772bedba2598dbd46b0b0b4f4'
         'fd5e7e49294ee8dc3a171f882ce60a70')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	cd "${pkgname}"

	sed -i \
		-e 's/skype24.png/skype.png/' \
		-e 's/skype24-1.png/skype-1.png/' \
		src/tray.js
}

build() {
	cd "${pkgname}/src"

	export npm_config_runtime=electron
	export npm_config_target=$(</usr/lib/electron/version)
	export npm_config_disturl=https://atom.io/download/electron
	export npm_config_build_from_source=true
	export npm_config_optional=false

	npm install --production

	asar p . ../../ghetto-skype.asar
}

package() {
	install -Dm0755 -t "${pkgdir}/usr/bin"                ghetto-skype
	install -Dm0644 -t "${pkgdir}/usr/share/applications" ghetto-skype.desktop
	install -Dm0644 -t "${pkgdir}/usr/lib/ghetto-skype"   ghetto-skype.asar

	install -Dm0644 "${pkgname}/src/assets/tray/skype.png" "${pkgdir}/usr/share/pixmaps/ghetto-skype.png"
}
