# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributer: Bruce Zhang
# This PKGBUILD is directly modified from aur/dingtalk

pkgname=lx-music
pkgver=1.11.0
pkgrel=1
pkgdesc='An Electron-based music player'
arch=('any')
url='https://github.com/lyswhut/lx-music-desktop'
license=('Apache')
changelog=CHANGELOG.md
depends=('electron' 'nodejs>=14')
makedepends=('asar' 'jq' 'moreutils' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('d7f64e91ad031469f8ecd240f20d135736fcf8240af7e1f1a901337e4a23bdb9'
            '0b19e2d26237f48379c024d48398a3a819b1de72bfe95c680f9a81c3d13c537f'
            '86c65106fb93671b2f3da2896ef69d709f0558b2113779b9ca45bbbb73de64ce')

prepare() {
	cd "$srcdir/$pkgname-desktop-$pkgver"
	local electronDist="/usr/lib/electron"
	local electronVersion="$(< $electronDist/version)"
	jq ".devDependencies.electron = \"$electronVersion\"" package.json | sponge package.json
	jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
	jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json
}

build() {
	cd "$srcdir/$pkgname-desktop-$pkgver"
	npm ci --cache npm-cache
	npm run pack:dir
}

package() {
	install -Dm755 lx-music.sh "$pkgdir/usr/bin/lx-music"
	install -Dm644 lx-music.desktop -t "$pkgdir/usr/share/applications/"

	# Install app
	cd "$srcdir/$pkgname-desktop-$pkgver/"
	asar e build/linux-unpacked/resources/app.asar "$pkgdir/usr/share/lx-music/"

	# Install icons
	install -Dm644 resources/icons/512x512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/lx-music.png"

	# Install license
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/lx-music/"
	cp -a --no-preserve=ownership licenses "$pkgdir/usr/share/licenses/lx-music/"
}
