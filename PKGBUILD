# Maintainer: surefire@cryptomile.net

pkgname=keeweb
pkgver=1.6.3
pkgrel=2
pkgdesc="Desktop password manager compatible with KeePass databases."
arch=('any')
url="https://github.com/keeweb/keeweb"
license=('MIT')
depends=('electron')
makedepends=('npm' 'asar')
optdepends=('xdotool: for auto-type')
conflicts=('keeweb-desktop')
source=("https://github.com/keeweb/keeweb/archive/v${pkgver}.tar.gz"
        'keeweb')

sha1sums=('75c054b23aa4f0f6fd067174623549f65ebe740a'
          'a2ab033d06abfe7616d2615d8edf7931f29efc96')

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

	# downgrade broken bower package https://github.com/eligrey/FileSaver.js/issues/409
	sed -i \
		-e '/FileSaver.js/ s|eligrey/FileSaver.js|\0#1.3.4|' \
	bower.json

	# upgrade node-sass
	sed -i \
		-e 's/"node-sass": "4.5.3"/"node-sass": "^4.9.3"/' \
	package.json
}

build() {
	cd "${pkgname}-${pkgver}"

	export SKIP_SASS_BINARY_DOWNLOAD_FOR_CI=1

	npm install --no-package-lock
	node_modules/.bin/grunt --skip-sign build-web-app build-desktop-app-content

	asar p tmp/desktop/app ../keeweb.asar
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0644 -t "${pkgdir}/usr/lib/keeweb" ../keeweb.asar
	install -Dm0755 -t "${pkgdir}/usr/bin"        ../keeweb

	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE DEPS-LICENSE

	install -Dm0644 -t "${pkgdir}/usr/share/mime/packages" package/deb/usr/share/mime/packages/keeweb.xml
	install -Dm0644 -t "${pkgdir}/usr/share/applications"  package/deb/usr/share/applications/keeweb.desktop

	install -Dm0644 graphics/128x128.png "${pkgdir}/usr/share/pixmaps/keeweb.png"
}
