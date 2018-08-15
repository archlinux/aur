# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.12.1
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('nss' 'libxss' 'gconf' 'gtk3' 'glibc')
makedepends=('sed' 'yarn>=0.21.3' 'nodejs>=7.0.0' 'node-gyp' 'python2')
conflicts=('rocketchat-client-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz")
sha512sums=('12c94d53d04748fd7876b6ffd2552d62ae10acdc07b49b928b0587b3421a9557f922d3595b3c431dc1cae44a5d5d2ab91e4ded8f3c2b5807d6598d428191d244')
if [[ $CARCH == "i686" ]]; then
    _releasename="release:linux-ia32"
    _distname="linux-ia32-unpacked"
else
    _releasename="release:linux-x64"
    _distname="linux-unpacked"
fi
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
	yarn build --env=production "$_releasename"
}
package() {
	install -Dm644 "$srcdir/$_srcname/snap/gui/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
	install -Dm644 "$srcdir/$_srcname/snap/gui/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
	install -Dm644 "$srcdir/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	mkdir -p "$pkgdir"/{usr/bin,opt}
	cp -rf "$srcdir/$_srcname/dist/$_distname" "$pkgdir/opt/$pkgname"
	ln -sf /opt/$pkgname/rocketchat "$pkgdir/usr/bin/$pkgname"
}
