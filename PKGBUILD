# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributer: Bruce Zhang

pkgname=lx-music
pkgver=1.22.0
pkgrel=1
pkgdesc='An Electron-based music player'
arch=('any')
url='https://github.com/lyswhut/lx-music-desktop'
license=('Apache')
depends=('electron')
makedepends=('asar' 'jq' 'moreutils' 'npm')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop"
        'dev-app-update.yml'
        )
sha256sums=('d82234a9c6ab54248623b8159605337df063cdacd316fdca3d1d84caef1a8322'
            '1e69184fd93f8d86d800306b99e5f630253d32de610342485ba5d4b0be018eb4'
            '732e98dfe569768c3cc90abbe8b1f6d24726dd2cb61317f57f8d5fe77fdefe2f'
            'ffdd88036d10eb9780c0a26987894708720c2f486247bb3854f05fb5dd607423')

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
	npm install
	npm run pack:dir
}

package() {
    install -Dm644 'dev-app-update.yml' -t  "$pkgdir/usr/share/lx-music/"
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
