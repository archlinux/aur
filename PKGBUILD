# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron11
_appname=insomnia
pkgname="$_appname-electron"
_dirname="$_appname-core"
pkgver=2022.1.0
pkgrel=1
pkgdesc='Cross-platform HTTP and GraphQL Client'
arch=(any)
url=https://github.com/Kong/insomnia
license=('MIT')
depends=("$_electron")
makedepends=(npm nvm fontconfig)
provides=("$_appname")
conflicts=("$_appname")
source=("$url/archive/core@$pkgver.tar.gz"
        "$_appname.sh"
        "$_appname.desktop"
        "electron_target.patch")
sha256sums=('eeb0d955bbd2ccfe043eb4ca951b8ec8462d86185c2dfbce35b999d8b0206d79'
            '9eba2a175624d9236f9acbefffd92a5a6a64bf6250700b29684d7aa4a1057c77'
            '790a02378c36db77797669e6b58a426a037664c2680e8b29b9f606c6bb517e94'
            'd8bd680dc7d4b56a58f28d93d54cf11ef897a2da7e09d80028ed42f94d3f08c9')

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
	GIT_TAG="core@$pkgver" npm run app-package
}

package() {
	cd "$_dirname-$pkgver"

	install -d "$pkgdir/usr/lib/$_appname"
	cp -r "packages/$_appname-app/dist/linux-unpacked/resources/." "$pkgdir/usr/lib/$_appname"

	install -Dm755 "$srcdir/$_appname.sh" "$pkgdir/usr/bin/$_appname"
	install -Dm644 "$srcdir/$_appname.desktop" -t "$pkgdir/usr/share/applications"

	install -Dm644 "packages/$_appname-app/app/ui/images/$_appname-core-logo.png" "$pkgdir/usr/share/pixmaps/$_appname.png"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
