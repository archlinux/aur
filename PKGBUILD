# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
_pkgname='ferdi'
pkgname="$_pkgname-git"
pkgver='5.4.4.beta.2.r40.gd269249a'
pkgrel='2'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application - git version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://get$_pkgname.com"
license=('Apache')
depends=('electron' 'libxkbfile')
makedepends=('git' 'npm' 'python')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$pkgname::git+https://github.com/get$_pkgname/$_pkgname"
	"$pkgname-recipes::git+https://github.com/get$_pkgname/recipes"
	"$pkgname-internal-server::git+https://github.com/get$_pkgname/internal-server"
	'fix-autostart-path.diff'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '91cc72f00db20e1bded69d08578e6ae9fdc89a4582ee8f6d29697b0233d7d095')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Provide git submodules
	git submodule init
	git config submodule.recipes.url "$srcdir/$pkgname-recipes"
	git config submodule.src/internal-server.url "$srcdir/$pkgname-internal-server"
	git submodule update --init --recursive

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat '/usr/lib/electron/version')"'"|' 'package.json'

	# Prevent Ferdi from being launched in dev mode
	sed -i "s|import isDevMode from 'electron-is-dev'|const isDevMode = false|g" 'src/index.js' 'src/config.js'
	sed -i "s|import isDev from 'electron-is-dev'|const isDev = false|g" 'src/environment.js'

	# Specify path for autostart file
	patch --forward -p1 < '../fix-autostart-path.diff'

	# Prepare dependencies
	export HOME="$srcdir/$pkgname-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
	export npm_config_devdir="$srcdir/$pkgname-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-npm-cache"

	npx lerna bootstrap
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g'
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
	export HOME="$srcdir/$pkgname-home"
	export XDG_CACHE_HOME="$srcdir/$pkgname-cache"
	export npm_config_devdir="$srcdir/$pkgname-npm-dev"
	export npm_config_cache="$srcdir/$pkgname-npm-cache"

	npx gulp build
	npx electron-builder --linux dir "--$_electronbuilderarch" -c.electronDist='/usr/lib/electron' -c.electronVersion="$(cat '/usr/lib/electron/version')"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	install -Dm644 'out/linux-unpacked/resources/app.asar' "$pkgdir/usr/lib/$_pkgname/app.asar"
	install -dm755 "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode 'out/linux-unpacked/resources/app.asar.unpacked/recipes/' "$pkgdir/usr/lib/$_pkgname/app.asar.unpacked/recipes/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$_pkgname"
#!/bin/sh
NODE_ENV=production exec electron '/usr/lib/$_pkgname/app.asar' "\$@"
EOF
	chmod +x "$pkgdir/usr/bin/$_pkgname"

	install -dm755 "$pkgdir/usr/share/applications/"
	cat << EOF > "$pkgdir/usr/share/applications/$_pkgname.desktop"
[Desktop Entry]
Name=${_pkgname^}
Exec=/usr/bin/$_pkgname %U
Terminal=false
Type=Application
Icon=$_pkgname
StartupWMClass=${_pkgname^}
Comment=Ferdi is your messaging app / former Emperor of Austria and combines chat & messaging services into one application. Ferdi currently supports Slack, WhatsApp, WeChat, HipChat, Facebook Messenger, Telegram, Google Hangouts, GroupMe, Skype and many more. You can download Ferdi for free for Mac & Windows.
MimeType=x-scheme-handler/ferdi;
Categories=Network;InstantMessaging;
EOF

	for _size in 16 24 32 48 64 96 128 256 512 1024; do
		install -Dm644 "build-helpers/images/icons/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
	done
}
