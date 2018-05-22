# Maintainer: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.10.5
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=2
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('alsa-lib' 'gtk2' 'libxtst' 'nss' 'libxss' 'gconf')
makedepends=('sed' 'yarn>=0.21.3' 'gulp' 'nodejs>=7.0.0' 'nodejs<10.0.0' 'node-gyp')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz")
sha512sums=('154a80a7de8393ef1d97741b4ec35105e81b2ff7d2d175c6505ff6fe1b4e75ef164df62304327c7809f3111c872312aa2b385accf0c01dd3fb457ec8db51fe82')
prepare() {
	sed -i 's/"deb",/"dir"/' "$srcdir/$_srcname/package.json"
	sed -i '/"rpm"/d' "$srcdir/$_srcname/package.json"
	sed -i 's|${SNAP}/meta/gui/icon.png|rocketchat-desktop|' "$srcdir/$_srcname/snap/gui/$pkgname.desktop"
}
build() {
	cd "$srcdir/$_srcname"
	yarn install --non-interactive --pure-lockfile --cache-folder "$srcdir/yarn-cache"
	yarn release
}
package() {
	install -Dm644 "$srcdir/$_srcname/snap/gui/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -Dm644 "$srcdir/$_srcname/snap/gui/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
	install -Dm644 "$srcdir/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	if [[ $CARCH == "i686" ]]; then
		_distname="linux-ia32-unpacked"
	else
		_distname="linux-unpacked"
	fi
	mkdir -p "$pkgdir"/{usr/bin,opt}
	cp -rf "$srcdir/$_srcname/dist/$_distname" "$pkgdir/opt/$pkgname"
	ln -sf /opt/$pkgname/rocketchat "$pkgdir/usr/bin/$pkgname"
}
