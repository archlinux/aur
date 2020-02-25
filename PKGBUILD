# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
pkgname='ferdi'
pkgver='5.4.3'
_recipescommit='3dcb305ffb706a7604cdfbadf7f2d2e236cb223d'
_internalservercommit='c39e8b45a51387f24d30e62a170681fc3422ad08'
pkgrel='4'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://get$pkgname.com"
license=('Apache')
depends=('electron')
makedepends=('npm')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/get$pkgname/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-recipes.tar.gz::https://github.com/get$pkgname/recipes/archive/$_recipescommit.tar.gz"
	"$pkgname-$pkgver-$pkgrel-internal-server.tar.gz::https://github.com/get$pkgname/internal-server/archive/$_internalservercommit.tar.gz"
	"$pkgname.desktop"
	"$pkgname.sh"
	'fix-autostart-path.diff'
)
sha256sums=('5b76514a103a46c9c3c578a474de28b9d5ba4140122cd0950cfe02b9b8e2c84f'
            '1061b711f465d886997db989bcb24b7746f19c9a18215a4e7576d05aa911575a'
            'afdc9d2783f6d4be8cc143bf866848781d3a28479c9bcfb7edade61bde1883a8'
            '5013233fc508f16b6782efa72da2ac242996f8555b3135aa0d2d98029c2bbc53'
            '3a21a67cc821892f9ae1b53b9108ec1859aa42b301fa6523c6c7accf6bc2a6c5'
            '91cc72f00db20e1bded69d08578e6ae9fdc89a4582ee8f6d29697b0233d7d095')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Provide git submodules
	rm -rf 'recipes/' 'src/internal-server/'
	mv "../recipes-$_recipescommit/" 'recipes/'
	mv "../internal-server-$_internalservercommit/" 'src/internal-server/'

	# Set system Electron version for ABI compatibility
	sed -E -i -e 's|("electron": ").*"|\1'"$(cat /usr/lib/electron/version)"'"|' 'package.json'

	# Prevent Ferdi from being launched in dev mode
	sed -i "s|import isDevMode from 'electron-is-dev'|const isDevMode = false|g" 'src/index.js' 'src/config.js'
	sed -i "s|import isDev from 'electron-is-dev'|const isDev = false|g" 'src/environment.js'

	# Specify path for autostart file
	patch --forward -p1 < '../fix-autostart-path.diff'

	# Prepare dependencies
	export HOME="$srcdir/$pkgname-$pkgver-$pkgrel-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-$pkgver-$pkgrel-cache"
	export npm_config_devdir="$srcdir/$pkgname-$pkgver-$pkgrel-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-$pkgver-$pkgrel-npm-cache"

	npx lerna bootstrap
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	case "$CARCH" in
		i686)
			local _electronbuilderarch='ia32'
		;;
		armv7h)
			local _electronbuilderarch='armv7l'
		;;
		aarch64)
			local _electronbuilderarch='arm64'
		;;
		*)
			local _electronbuilderarch='x64'
		;;
	esac

	export NODE_ENV='production'
	export HOME="$srcdir/$pkgname-$pkgver-$pkgrel-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-$pkgver-$pkgrel-cache"
	export npm_config_devdir="$srcdir/$pkgname-$pkgver-$pkgrel-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-$pkgver-$pkgrel-npm-cache"

	npx gulp build
	npx electron-builder --linux dir "--$_electronbuilderarch" -c.electronDist='/usr/lib/electron' -c.electronVersion="$(cat /usr/lib/electron/version)"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	install -Dm644 'out/linux-unpacked/resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	install -dm755 "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode 'out/linux-unpacked/resources/app.asar.unpacked/recipes/' "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/recipes/"

	install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "build-helpers/images/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png"
	done
}
