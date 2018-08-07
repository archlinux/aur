# Maintainer: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.12.0
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=4
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('nss' 'libxss' 'gconf' 'gtk3' 'glibc<=2.27')
makedepends=('sed' 'yarn>=0.21.3' 'nodejs>=7.0.0' 'node-gyp' 'python2')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz")
sha512sums=('7096828d0aeadef5aed3d23d1492a24c11d51e60d6a0724fbc7e9f1434f8da08d8c4e2eb79391e51bd0b7e2881b26e75394ee00386f85bbb60df5b0bdea11d6b')
prepare() {
	sed -i 's/"tar.gz",/"dir"/' "$srcdir/$_srcname/package.json"
	sed -i '/"deb",/d' "$srcdir/$_srcname/package.json"
	sed -i '/"rpm",/d' "$srcdir/$_srcname/package.json"
	sed -i '/"snap"/d' "$srcdir/$_srcname/package.json"
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
