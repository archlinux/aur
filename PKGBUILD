# Maintainer: surefire@cryptomile.net

pkgname=keeweb
pkgver=1.4.0
pkgrel=1
pkgdesc="Desktop password manager compatible with KeePass databases."
arch=('any')
url="https://github.com/antelle/keeweb"
license=('MIT')
depends=('electron')
makedepends=('npm' 'asar')
optdepends=('xdotool: for auto-type')
conflicts=('keeweb-desktop')
source=("https://github.com/keeweb/keeweb/archive/v${pkgver}.tar.gz"
        'keeweb')

sha1sums=('01cba0ac0a216a27b6258ac597ba7357019d150f'
          '6f73285126a5d6d948712de73053957528aba0cc')

prepare() {

	cd "${pkgname}-${pkgver}"

	# remove extra dependencies
	sed -i \
		-e '/"babel-/                  d' \
		-e '/"electron": "^/           d' \
		-e '/"grunt-electron"/         d' \
		-e '/"grunt-appdmg"/           d' \
		-e '/"grunt-concurrent"/       d' \
		-e '/"grunt-contrib-compress"/ d' \
		-e '/"grunt-contrib-deb"/      d' \
		-e '/"grunt-contrib-watch"/    d' \
		-e '/"grunt-contrib-uglify"/   d' \
		-e '/"grunt-eslint"/           d' \
		-e '/"eslint/                  d' \
		-e '/"uglify-loader"/          d' \
		-e '/"webpack-dev-server"/     d' \
		-e '/"webpack"/           s/,$//' \
	package.json

	sed -i \
		-e "/electronVersion/           d" \
		-e "/loader: 'babel-loader'/,+2 d" \
		-e "/loader: 'uglify-loader'/   d" \
		-e "/'eslint',/                 d" \
		-e "/'uglify',/                 d" \
	Gruntfile.js

	# hide electron menu
	sed -i \
		-e '/mainWindow = new electron\.BrowserWindow({$/ a \        autoHideMenuBar: true,' \
	desktop/app.js

	sed -i \
		-e '/Exec=/ c \Exec=keeweb %u' \
	package/deb/usr/share/applications/keeweb.desktop
}

build() {
	cd "${pkgname}-${pkgver}"

	npm install --no-shrinkwrap
	node_modules/.bin/grunt build-web-app build-desktop-app-content

	asar p tmp/desktop/app ../keeweb.asar
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0644 -t "${pkgdir}/usr/lib/keeweb" ../keeweb.asar
	install -Dm0755 -t "${pkgdir}/usr/bin"        ../keeweb

	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt LICENSES-DEPS.txt

	install -Dm0644 -t "${pkgdir}/usr/share/mime/packages" package/deb/usr/share/mime/packages/keeweb.xml
	install -Dm0644 -t "${pkgdir}/usr/share/applications"  package/deb/usr/share/applications/keeweb.desktop

	install -Dm0644 graphics/128x128.png "${pkgdir}/usr/share/pixmaps/keeweb.png"

}
