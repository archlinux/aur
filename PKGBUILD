# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=3.84.10
pkgrel=2
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('nss' 'libappindicator-gtk3' 'libnotify' 'org.freedesktop.secrets')
makedepends=('npm' 'nvm')
source=("https://github.com/tutao/tutanota/archive/tutanota-release-$pkgver.tar.gz"
        "$pkgname"
        "$pkgname.desktop")
sha256sums=('b7a1e1652addb94c4b41f3868989fcea39c72851c03a8be4a4f708f8ad5ec6b3'
            '4f91e842bd92a3312943854383e4929f9baf6cb684a7027aa55edcce1bf4ca16'
            'a2e2b932eb0bc2ad2413b7f39eb9fbdb517f5670367413f76d718d5d270996f7')

_ensure_local_nvm() {
	# lets be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="$srcdir/.nvm"

	# The init script returns 3 if version
	# specified in ./.nvrc is not (yet) installed in $NVM_DIR
	# but nvm itself still gets loaded ok
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	# Use Node.js 14 per upstream
	export npm_config_cache="$srcdir/npm-cache"
	local npm_prefix=$(npm config get prefix)
	local nodeversion='14.17.2'
	npm config delete prefix
	_ensure_local_nvm
	nvm install "$nodeversion" && nvm use "$nodeversion"
}

build() {
	cd "${pkgname%-*}-${pkgname%-*}-release-$pkgver"
	_ensure_local_nvm
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
		install -Dm644 resources/desktop-icons/icon/${icon_size}.png \
			$pkgdir$icons_dir/$pkgname.png
	done

	install -Dm644 "$srcdir/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
}
