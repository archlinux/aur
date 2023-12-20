# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron27
_appname=insomnia
pkgname="$_appname-electron"
_dirname="$_appname-core"
epoch=1
pkgver=8.5.0
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
b2sums=('9568fa508bce8fcfa38a85b32cb502ed9e9a4b6a63e6c91069de99410a9763382ff87cc9b5ff215380c1d3568003df4eeb885c310e9b65699a9cf86ca5789c43'
        '6fa7a0c1709a354a8d189b477f170bc04721a6236e7ffbd3eedb252e5b7c00da38619b958253c7f3a244c02fcbeafc9431779978b10de4ed308ed8c825e9e410'
        'd7f795312b38ccd63cdc9a9333a5cdb3d1271b07d6855bc10c4711e143f0a30bd819cda931d99ed0090536ffa84b551a8d134299f614506b0e344c15afe19f6c'
        '64002d1772108caa6d6b725fdff1c86b0b092e7a169b947e4521be93358096ac47fe5c954fda116c5a27f5a466fd4c10ee0e6f170cb1524a26f636da7618c0ae')

_ensure_local_nvm() {
	# lets be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload

	export NVM_DIR="$srcdir/$_dirname-$pkgver/.nvm"
	# The init script returns 3 if version
	#   specified in ./.nvmrc is not (yet) installed in $NVM_DIR
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
	npm install
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
