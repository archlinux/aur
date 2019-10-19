# Maintainer: surefire@cryptomile.net
# Contributor: Edison Ibañez <edison@opmbx.org>

pkgname=sqlectron-gui
pkgver=1.30.0
pkgrel=4
pkgdesc="A simple and lightweight SQL client with cross database and platform support"
arch=('x86_64')
url="https://sqlectron.github.io/"
license=('MIT')
depends=('electron2')
makedepends=(
	'asar'
	'libsass'
	'npm'
)
source=("https://github.com/sqlectron/sqlectron-gui/archive/v${pkgver}.tar.gz"
        'sqlectron-gui.sh'
		'sqlectron-gui.desktop'
		'node.sh'
)

sha1sums=('467869f0678cc0e99ca268c9c3d1aafc565c130f'
          '6ad81d34e04c1760d4be27f0e4ec25ff5267deca'
          'b9fb3bc29a17dee5de9295e2fdb2b3025ed51d1f'
          '1c03020a3cba2e4d054ff565d3b607efb8f8cf58')

prepare() {
	cd "$pkgname-$pkgver"

	# remove extra dependencies
	sed -i package.json \
		-e '/"node-sass":/  s/3\.4\.2/4.11.0/' \
		-e '/"postinstall":/            d' \
		-e '/"electron":/               d' \
		-e '/"electron-builder":/       d' \
		-e '/"spawn-auto-restart":/     d' \
		-e '/"webpack-dev-middleware":/ d' \
		-e '/"webpack-dev-server":/     d' \
		-e '/"webpack-bundle-analyzer":/ s/,$//'

	install -Dm0755 "$srcdir/node.sh" "$srcdir/bin/node"
}

build() {
	cd "$pkgname-$pkgver"

	export PATH="$srcdir/bin:$PATH"
	export SASS_FORCE_BUILD=1
	export LIBSASS_EXT=auto
	export npm_config_optional=false
	export npm_config_nodedir=/usr/lib/electron2/node
	export npm_config_scripts_prepend_node_path=false

	npm install --build-from-source

	npm run compile:browser
	npm run compile:renderer

	mkdir app
	mv -t ./app out
	cp -t ./app package.json

	pushd app
	npm install \
		--production \
		--build-from-source \
		--runtime=electron \
		--target=$(</usr/lib/electron2/version)
	popd

	asar p app app.asar
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm0755 ../sqlectron-gui.sh "${pkgdir}/usr/bin/sqlectron-gui"

	install -Dm0644 build/app.png "${pkgdir}/usr/share/pixmaps/sqlectron-gui.png"

	install -Dm0644 -t "${pkgdir}/usr/lib/sqlectron-gui" app.asar

	install -Dm0644 -t "${pkgdir}/usr/share/applications"  ../sqlectron-gui.desktop

	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
