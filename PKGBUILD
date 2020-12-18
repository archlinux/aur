# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=3.79.2
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libxss' 'libxtst' 'libappindicator-gtk3' 'libnotify')
makedepends=('npm' 'nvm')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('163d990d7a5420bb036061c4333dcb461633cb89c77504777c051616b14518eb'
            '4f91e842bd92a3312943854383e4929f9baf6cb684a7027aa55edcce1bf4ca16'
            'a2e2b932eb0bc2ad2413b7f39eb9fbdb517f5670367413f76d718d5d270996f7')

build() {
	# Use nodejs v10 per upstream
	export npm_config_cache="$srcdir/npm-cache"
	local npm_prefix=$(npm config get prefix)
	local nodeversion='10.23.0'
	npm config delete prefix
	source /usr/share/nvm/init-nvm.sh
	nvm install "$nodeversion" && nvm use "$nodeversion"

	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"
	npm install
	node dist -l --custom-desktop-release --unpacked

	# Restore node config from nvm
	npm config set prefix "$npm_prefix"
	nvm unalias default
}

package() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"
	install -d "$pkgdir/opt/$pkgname"
	cp -r build/desktop/linux-unpacked/* \
		"$pkgdir/opt/$pkgname"

	install -Dm755 "$srcdir/$pkgname" -t "$pkgdir/usr/bin"

	for icon_size in 64 512; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir$icons_dir
		install -m644 resources/desktop-icons/icon/${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done

	install -Dm644 "$srcdir/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
}
