# Maintainer: surefire@cryptomile.net

pkgname=keeweb
pkgver=1.7.2
pkgrel=1
pkgdesc="Desktop password manager compatible with KeePass databases."
arch=('any')
url="https://github.com/keeweb/keeweb"
license=('MIT')
depends=('electron')
makedepends=(
	'asar'
	'npm'
	'libsass'
)
optdepends=('xdotool: for auto-type')
conflicts=('keeweb-desktop')
source=(
	"https://github.com/keeweb/keeweb/archive/v${pkgver}.tar.gz"
	'hide-menubar.patch'
	'keeweb.sh'
	'package.json.patch.js'
)

sha1sums=('2526922e7f872cb17a775321b55788d1c5d48854'
          'a55c2ed276c6073b7954452cdc88209633d51ace'
          'a2ab033d06abfe7616d2615d8edf7931f29efc96'
          '6fef823604bfeac45bc6aa830c1f129c15a80fcf')

prepare() {
	cd "${pkgname}-${pkgver}"

	patch -Np1 -i ../hide-menubar.patch

	# remove extra dependencies
	node ../package.json.patch.js

	sed -i \
		-e "/const electronVersion/       s/pkg.dependencies.electron/'$(</usr/lib/electron/version)'/" \
	Gruntfile.js

	sed -i \
		-e "/'eslint',/                 d" \
		-e "/'uglify',/                 d" \
	grunt.tasks.js

	sed -i \
		-e '/Exec=/ c \Exec=keeweb %u' \
	package/deb/usr/share/applications/keeweb.desktop
}

build() {
	cd "${pkgname}-${pkgver}"

	export SKIP_SASS_BINARY_DOWNLOAD_FOR_CI=1
	export LIBSASS_EXT=auto

	npm install

	ln -fs normalize.css node_modules/normalize.css/normalize.scss

	npx grunt build-web-app build-desktop-app-content

	asar p tmp/desktop/app ../keeweb.asar
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 ../keeweb.sh "${pkgdir}/usr/bin/keeweb"
	install -Dm0644 -t "${pkgdir}/usr/lib/keeweb" ../keeweb.asar

	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE DEPS-LICENSE

	install -Dm0644 -t "${pkgdir}/usr/share/mime/packages" package/deb/usr/share/mime/packages/keeweb.xml
	install -Dm0644 -t "${pkgdir}/usr/share/applications"  package/deb/usr/share/applications/keeweb.desktop

	install -Dm0644 graphics/128x128.png "${pkgdir}/usr/share/pixmaps/keeweb.png"
}
