# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron11
_appname=insomnia
pkgname="$_appname-electron"
_dirname="$_appname-core"
pkgver=2021.5.3
pkgrel=1
pkgdesc='Cross-platform HTTP and GraphQL Client'
arch=(any)
url=https://github.com/Kong/insomnia
license=('MIT')
depends=("$_electron")
makedepends=(npm nvm fontconfig)
checkdepends=()
optdepends=()
provides=(insomnia)
source=("$url/archive/core@$pkgver.tar.gz"
        "$_appname.sh"
				"$_appname.desktop")
sha256sums=('86f26c2c2d9fc4f7aa27fc821e69fbc21b2e5fefc3b471a7059d5edd0a1688c2'
            '9eba2a175624d9236f9acbefffd92a5a6a64bf6250700b29684d7aa4a1057c77'
            '790a02378c36db77797669e6b58a426a037664c2680e8b29b9f606c6bb517e94')

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
	cd "$srcdir"
	sed -i "s~@ELECTRON@~$_electron~" "$_appname.sh"
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
