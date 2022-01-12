# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
pkgname='ferdi'
pkgver='5.7.0'
_recipescommit='47473f7f5a52e21289024a919f630475dcffecc2'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://get$pkgname.com"
license=('Apache')
_electronpkg='electron15'
depends=("$_electronpkg" 'libxkbfile')
# We're depending on node v16 until https://github.com/nodejs/node-gyp/issues/2534 is fixed
makedepends=('git' 'nodejs-lts-gallium' 'npm>=8.1.0' 'pnpm' 'python')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/get$pkgname/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-recipes.tar.gz::https://github.com/get$pkgname/recipes/archive/$_recipescommit.tar.gz"
	'fix-autostart-path.diff'
)
sha512sums=('21d2b788435ed24cba4b327e4a6eb1caed63dd57ef5147402370140a3b37ae901b46588934b75c1032c328d1a75762aeaa3b5af9a601cbbe455a5ced37eafd9d'
            'b38f22140a741c0126dec3b008044f0693540381da120030c95518d2befce09f224aa05d247e81afda10ebf220bfb8f8d2e8581b2de648ed171538f4c0d8f6b7'
            '5263a9e1f4f9e4435f857181e67eb6b3ed254a18371ab5430bdf614821831aea2474f385b3860e783119fed5eb0c5f0cc94c74b1510e2ae29da524cd0d77fee3')

_sourcedirectory="$pkgname-$pkgver"

case "$CARCH" in
	i686)
		_electronbuilderarch='ia32'
	;;
	armv7h)
		_electronbuilderarch='armv7l'
	;;
	aarch64)
		_electronbuilderarch='arm64'
	;;
	*)
		_electronbuilderarch='x64'
	;;
esac

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Provide git submodules
	rm -rf 'recipes/'
	mv "../recipes-$_recipescommit/" 'recipes/'

	# Set system Electron version for ABI compatibility
	sed -E -i 's|("electron": ").*"|\1'"$(cat "/usr/lib/$_electronpkg/version")"'"|' 'package.json'

	# Loosen node version restriction
	sed -E -i 's|("node": ").*"|\1'"$(node --version | sed 's/^v//')"'"|' 'package.json'

	# Specify path for autostart file
	patch --forward -p1 < '../fix-autostart-path.diff'

	# Prepare recipes
	cd "$srcdir/$_sourcedirectory/recipes/"

	# Disable the prepare script for recipes as we don't want husky to run
	sed -E -i 's|"prepare": ".*"|"prepare": ""|' 'package.json'

	# Build recipe archives
	pnpm install
	pnpm run package

	# Prepare ferdi dependencies
	cd "$srcdir/$_sourcedirectory/"

	# Disable the prepare script for ferdi itself as we don't want husky to run
	sed -E -i 's|"prepare": ".*"|"prepare": ""|' 'package.json'

	# Install ferdi dependencies
	npm install
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	# Run pre-build tasks: prepare build info, run gulp
	npm run prebuild

	# Use npmrc from the root folder for npm>=6 compatibility
	cp '.npmrc' 'build/.npmrc'

	# Build the actual application
	NODE_ENV='production' ./node_modules/.bin/electron-builder --linux dir "--$_electronbuilderarch" -c.electronDist="/usr/lib/$_electronpkg" -c.electronVersion="$(cat "/usr/lib/$_electronpkg/version")"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	local _outpath='out/linux'
	if [ "$_electronbuilderarch" != 'x64' ]; then
		_outpath="$_outpath-$_electronbuilderarch"
	fi
	_outpath="$_outpath-unpacked"

	install -Dm644 "$_outpath/resources/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
	cp -r --no-preserve=ownership --preserve=mode "$_outpath/resources/app.asar.unpacked/" "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
NODE_ENV=production ELECTRON_IS_DEV=0 exec $_electronpkg '/usr/lib/$pkgname/app.asar' "\$@"
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
