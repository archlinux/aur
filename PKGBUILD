# Maintainer: surefire@cryptomile.net

pkgname=keeweb
pkgver=1.3.3
pkgrel=2
pkgdesc="Desktop password manager compatible with KeePass databases."
arch=('any')
url="https://github.com/antelle/keeweb"
license=('MIT')
depends=('electron')
makedepends=('npm' 'asar')
conflicts=("keeweb-desktop")
source=("https://github.com/keeweb/keeweb/archive/v${pkgver}.tar.gz"
        'keeweb.desktop'
        'keeweb'
)

sha1sums=('82916cdf893ea1d2b1d69e2fe2592deccabd57dd'
          'd2ac08ed22950787a7a0c074be050822ca97f74f'
          '339d6b5ca97f0c67f71db7e5b058047e921ef6dc')

prepare() {

    cd "${pkgname}-${pkgver}"


    # remove extra dependencies

	rm npm-shrinkwrap.json

    sed -i \
		-e '/"electron-prebuilt"/      d' \
		-e '/"grunt-electron"/         d' \
		-e '/"grunt-appdmg"/           d' \
		-e '/"grunt-contrib-compress"/ d' \
		-e '/"grunt-contrib-deb"/      d' \
		-e '/"grunt-contrib-watch"/    d' \
		-e '/"postinstall"/            d' \
	package.json

	sed -i \
		-e '/electronVersion/ d' \
	Gruntfile.js

	# hide electron menu
	sed -i \
		-e '/mainWindow = new electron\.BrowserWindow({$/ a \        autoHideMenuBar: true,' \
	electron/app.js
}

build() {
	cd "${pkgname}-${pkgver}"

	npm install
	node_modules/.bin/grunt

    cp electron/* dist

    asar p dist ../keeweb.asar
}

package() {
    cd "${pkgname}-${pkgver}"

	install -Dm0644 -t "${pkgdir}/usr/lib/keeweb" ../keeweb.asar
    install -Dm0755 -t "${pkgdir}/usr/bin"  ../keeweb

    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt

    install -Dm0644 -t "${pkgdir}/usr/share/applications" ../keeweb.desktop
    install -Dm0644 electron/icon.png "${pkgdir}/usr/share/pixmaps/keeweb.png"

}
