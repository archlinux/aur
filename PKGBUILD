# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
pkgname='ferdi'
pkgver='5.4.3'
_recipescommit='3dcb305ffb706a7604cdfbadf7f2d2e236cb223d'
_internalservercommit='c39e8b45a51387f24d30e62a170681fc3422ad08'
pkgrel='8'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://get$pkgname.com"
license=('Apache')
depends=('electron' 'libxkbfile')
makedepends=('npm' 'python')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/get$pkgname/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-recipes.tar.gz::https://github.com/get$pkgname/recipes/archive/$_recipescommit.tar.gz"
	"$pkgname-$pkgver-$pkgrel-internal-server.tar.gz::https://github.com/get$pkgname/internal-server/archive/$_internalservercommit.tar.gz"
	'fix-autostart-path.diff'
)
sha256sums=('5b76514a103a46c9c3c578a474de28b9d5ba4140122cd0950cfe02b9b8e2c84f'
            '1061b711f465d886997db989bcb24b7746f19c9a18215a4e7576d05aa911575a'
            'afdc9d2783f6d4be8cc143bf866848781d3a28479c9bcfb7edade61bde1883a8'
            '91cc72f00db20e1bded69d08578e6ae9fdc89a4582ee8f6d29697b0233d7d095')

_sourcedirectory="$pkgname-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Provide git submodules
	rm -rf 'recipes/' 'src/internal-server/'
	mv "../recipes-$_recipescommit/" 'recipes/'
	mv "../internal-server-$_internalservercommit/" 'src/internal-server/'

	# Set system Electron version for ABI compatibility
	sed -E -i -e 's|("electron": ").*"|\1'"$(cat '/usr/lib/electron/version')"'"|' 'package.json'

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
	npx electron-builder --linux dir "--$_electronbuilderarch" -c.electronDist='/usr/lib/electron' -c.electronVersion="$(cat '/usr/lib/electron/version')"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	install -Dm644 'out/linux-unpacked/resources/app.asar' "$pkgdir/usr/lib/$pkgname/app.asar"
	install -dm755 "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode 'out/linux-unpacked/resources/app.asar.unpacked/recipes/' "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/recipes/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
NODE_ENV=production exec electron '/usr/lib/$pkgname/app.asar' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$pkgname"

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$pkgname.desktop"
[Desktop Entry]
Name=${pkgname^}
Exec=/usr/bin/$pkgname %U
Terminal=false
Type=Application
Icon=$pkgname
StartupWMClass=${pkgname^}
Comment=Ferdi is your messaging app / former Emperor of Austria and combines chat & messaging services into one application. Ferdi currently supports Slack, WhatsApp, WeChat, HipChat, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more. You can download Ferdi for free for Mac & Windows.
MimeType=x-scheme-handler/ferdi;
Categories=Network;InstantMessaging;
EOF

	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "build-helpers/images/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png"
	done
}
