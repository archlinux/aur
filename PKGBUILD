# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron
_appname=insomnia
pkgname="$_appname-electron"
_dirname="$_appname-core"
pkgver=2022.4.2
pkgrel=1
pkgdesc='Cross-platform HTTP and GraphQL Client'
arch=(any)
url=https://github.com/Kong/insomnia
license=('MIT')
depends=("$_electron")
makedepends=(npm nvm fontconfig libicns)
provides=("$_appname")
conflicts=("$_appname")
source=("$url/archive/core@$pkgver.tar.gz"
        "$_appname.sh"
        "$_appname.desktop"
        "electron_target.patch")
sha256sums=('20a9693e672dd700cbbc9ef92a6708cbd38f5d610741bc8bae4593596f51fe6a'
            'b490182126b4e05287156066ca41697f2ebf982c5d7b5c8e06fcfce0ce49aac2'
            '790a02378c36db77797669e6b58a426a037664c2680e8b29b9f606c6bb517e94'
            '33e5bc9c5e0a88f93d147006e8878ee59842d171398fd19e3a502a61fc7d9691')

_ensure_local_nvm() {
	# lets be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

	export NVM_DIR="$srcdir/$_dirname-$pkgver/.nvm"
	# The init script returns 3 if version
	#   specified in ./.nvrc is not (yet) installed in $NVM_DIR
	#   but nvm itself still gets loaded ok
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	_ensure_local_nvm
	sed -i "s~@ELECTRON@~$_electron~" "$_appname.sh"
	cd "$_dirname-$pkgver"
	nvm install
	patch -p1 -i "$srcdir/electron_target.patch"
}

build() {
	_ensure_local_nvm
	cd "$_dirname-$pkgver"
	npm run bootstrap
	GIT_TAG="core@$pkgver" npm run app-package -- \
		--dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
	cd "$_dirname-$pkgver"

	install -d "$pkgdir/usr/lib/$_appname"
	cp -r "packages/$_appname/dist/linux-unpacked/resources" "$pkgdir/usr/lib/$_appname"
	install -Dm644 package.json "$pkgdir/usr/lib/$_appname"

	install -Dm755 "$srcdir/$_appname.sh" "$pkgdir/usr/bin/$_appname"
	install -Dm644 "$srcdir/$_appname.desktop" -t "$pkgdir/usr/share/applications"

	icns2png -x "packages/$_appname/src/icons/icon.icns"
	install -Dm644 icon_512x512x32.png "$pkgdir/usr/share/pixmaps/$_appname.png"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
