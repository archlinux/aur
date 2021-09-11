# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Christoph Mohr <christoph.mohr@gmail.com>
# Contributor: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>
pkgname='ferdi'
pkgver='5.6.1'
_recipescommit='62599c06f4b2039219e282b34a51a4ff4fbe5e67'
pkgrel='1'
pkgdesc='A messaging browser that allows you to combine your favorite messaging services into one application'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://get$pkgname.com"
license=('Apache')
depends=('electron13' 'libxkbfile')
makedepends=('git' 'nodejs>=14.0.0' 'npm6' 'pnpm' 'python' 'python2')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/get$pkgname/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-recipes.tar.gz::https://github.com/get$pkgname/recipes/archive/$_recipescommit.tar.gz"
	'fix-autostart-path.diff'
	'remove-meetfranz-unpack.diff'
)
sha512sums=('c61ac5b76738527698074ade746994109a04c2991d64161dfde903e5bc8143db07b623eefe3d93a29268c3f8fb34268d9fe185bac0c836325389253cf28cd190'
            '6c1823f77de1b41e6201fd1bb3ef05b0d213e913bdd3c6d124b127023fc96764b8b84074408fd9707cc6f065c80a2e942061d7dc85137865f1f5155435a9e9a0'
            '4c179a9ec233393d9cdc58f5cc28fc66096b8fcb72eee8c827b045f477fdbc9a30ccf1e42d7aca1bdf46f21ad8962bfabaa84d686116197e73c62d99719b7174'
            'fd7f735dbb735b2eb8b2fd63f74981fc415ebe5afd964100a54840676ab8059acfc82c3a48e394db2e8eb4094f266b2578d64f867a448e6932f7b936db3cd151')

_sourcedirectory="$pkgname-$pkgver"
_homedirectory="$pkgname-$pkgver-$pkgrel-home"

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
	sed -E -i 's|("electron": ").*"|\1'"$(cat '/usr/lib/electron13/version')"'"|' 'package.json'

	# Loosen node version restriction
	sed -E -i 's|("node": ").*"|\1'"$(node --version | sed 's/^v//')"'"|' 'package.json'

	# Specify path for autostart file
	patch --forward -p1 < '../fix-autostart-path.diff'

	# Remove asarUnpack rule for @meetfranz packages
	patch --forward -p1 < '../remove-meetfranz-unpack.diff'

	cd "$srcdir/$_sourcedirectory/recipes/"

	# Disable the prepare script as we don't want husky to run
	sed -E -i 's|"prepare": "npx husky install"|"prepare": ""|' 'package.json'

	# Build recipe archives
	HOME="$srcdir/$_homedirectory" pnpm install
	HOME="$srcdir/$_homedirectory" pnpm run package

	cd "$srcdir/$_sourcedirectory/"

	# Disable the prepare script as we don't want husky to run
	sed -E -i 's|"prepare": "node scripts/prepare.js"|"prepare": ""|' 'package.json'

	# Prepare dependencies
	HOME="$srcdir/$_homedirectory" npx lerna bootstrap
}

build() {
	cd "$srcdir/$_sourcedirectory/"

	NODE_ENV='production' HOME="$srcdir/$_homedirectory" npx gulp build
	NODE_ENV='production' HOME="$srcdir/$_homedirectory" npx electron-builder --linux dir "--$_electronbuilderarch" -c.electronDist='/usr/lib/electron13' -c.electronVersion="$(cat '/usr/lib/electron13/version')"
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	local _outpath='out/linux'
	if [ "$_electronbuilderarch" != 'x64' ]; then
		_outpath="$_outpath-$_electronbuilderarch"
	fi
	_outpath="$_outpath-unpacked"

	install -Dm644 "$_outpath/resources/app.asar" "$pkgdir/usr/lib/$pkgname/app.asar"
	install -dm755 "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/"
	cp -r --no-preserve=ownership --preserve=mode "$_outpath/resources/app.asar.unpacked/recipes/" "$pkgdir/usr/lib/$pkgname/app.asar.unpacked/recipes/"

	install -dm755 "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/$pkgname"
#!/bin/sh
NODE_ENV=production ELECTRON_IS_DEV=0 exec electron13 '/usr/lib/$pkgname/app.asar' "\$@"
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
