# Maintainer: surefire@cryptomile.net
# Contributor: Edison Ibañez <edison@opmbx.org>

pkgname=sqlectron-gui
_electron=electron9
pkgver=1.35.0
pkgrel=1
pkgdesc="A simple and lightweight SQL client with cross database and platform support"
arch=('x86_64')
url="https://sqlectron.github.io/"
license=('MIT')
depends=($_electron)
makedepends=(
	'asar'
	'git'
	'libsass'
	'npm'
	'python2'
)
source=(
	"git+https://github.com/sqlectron/sqlectron-gui.git#tag=v${pkgver}"
	'sqlectron-gui.desktop'
)

sha1sums=('SKIP'
          'b9fb3bc29a17dee5de9295e2fdb2b3025ed51d1f')

case "$CARCH" in
	i686)    _arch=ia32;;
	x86_64)  _arch=x64;;
	aarch64) _arch=arm64;;
	*)       _arch=DUMMY;;
esac

prepare() {
	cd "$pkgname"

	# remove extra dependencies
	sed -i package.json \
		-e '/"postinstall":/            d' \
		-e '/"electron":/               d' \
		-e '/"electron-builder":/       d' \
		-e '/"electron-devtools-installer":/  d' \
		-e '/"spawn-auto-restart":/     d' \
		-e '/"webpack-dev-middleware":/ d' \
		-e '/"webpack-dev-server":/     d' \
		-e '/"webpack-cli":/ s/,$//'
}

build() {
	cd "$pkgname"

	export PATH="$srcdir/bin:$PATH"
	export SKIP_SASS_BINARY_DOWNLOAD_FOR_CI=1
	export SASS_FORCE_BUILD=1
	export LIBSASS_EXT=auto
	export npm_config_optional=false
	export npm_config_build_from_source=true
	export npm_config_sqlite=/usr

	npm install

	npm run compile:browser
	npm run compile:renderer

	mkdir app
	mv -t  app out
	cp -rt app build package.json

	cd app

	export npm_config_arch=$_arch
	export npm_config_target_arch=$_arch
	export npm_config_runtime=electron
	export npm_config_target=$(</usr/lib/$_electron/version)
	export npm_config_disturl=https://electronjs.org/headers

	HOME="$srcdir/.electron-gyp" npm install --production

	cat <<-EOF > ../sqlectron-gui
		#!/usr/bin/sh
		exec $_electron /usr/lib/sqlectron-gui/app.asar "\$@"
	EOF
}

package() {
	cd "$pkgname"

	asar p app app.asar

	install -Dm0755 -t "${pkgdir}/usr/bin" sqlectron-gui
	install -Dm0644 -t "${pkgdir}/usr/share/applications" ../sqlectron-gui.desktop
	install -Dm0644 -t "${pkgdir}/usr/lib/sqlectron-gui" app.asar
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	install -Dm0644 build/app.png "${pkgdir}/usr/share/pixmaps/sqlectron-gui.png"
}
