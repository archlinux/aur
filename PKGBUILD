# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron38
_appname=insomnia
pkgname="$_appname-electron"
_dirname="$_appname-core"
epoch=1
pkgver=12.2.0 # renovate: datasource=github-tags depName=Kong/insomnia extractVersion=^core@(?<version>(?:[^2].*|2(?:$|[^0].*)|20(?:$|[^2].*)|202(?:$|[^0-3].*|[0-3](?:$|[^.].*))))
pkgrel=1
pkgdesc='Cross-platform HTTP and GraphQL Client'
arch=(any)
url=https://github.com/Kong/insomnia
license=('Apache-2.0')
depends=("$_electron")
makedepends=(npm nvm fontconfig libicns yarn)
provides=("$_appname")
conflicts=("$_appname")
source=("$url/archive/core@$pkgver.tar.gz"
        "$_appname.sh"
        "$_appname.desktop"
				"disable_verify_bundle_plugins.patch"
        "electron_target.patch")
b2sums=('6eaf1fa99c9dc93e66db10d173d80914fdab35ef0daa9d67d8f50155626e9ffbf1f9de2006ed9a003cd080d2c462c13e2f695e4c1b10427f7618b8265812c341'
        '6fa7a0c1709a354a8d189b477f170bc04721a6236e7ffbd3eedb252e5b7c00da38619b958253c7f3a244c02fcbeafc9431779978b10de4ed308ed8c825e9e410'
        'd7f795312b38ccd63cdc9a9333a5cdb3d1271b07d6855bc10c4711e143f0a30bd819cda931d99ed0090536ffa84b551a8d134299f614506b0e344c15afe19f6c'
        'b095c6b47d62670cb70c8bfb3ed7d605472522581b0a8a16ea2d3159bf4d44c57ae1347f98bdbc2ff1749f22f792b72cb965e9ade60aad8eb3bff06cf4db65ec'
        '27358ae8207d91b06ee4ff98c4ddf5b206c7869ca2fb00be3f38b49c2c7fc5268557f4166977f5804d17ab14f3d8a43b5951a52c24557721b973d832d3a35ed9')

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
	patch -p1 -i "$srcdir/disable_verify_bundle_plugins.patch"
	patch -p1 -i "$srcdir/electron_target.patch"
}

build() {
	_ensure_local_nvm
	cd "$_dirname-$pkgver"
	npm install
	GIT_TAG="core@$pkgver" NODE_OPTIONS=--max_old_space_size=8192 npm run app-package -- \
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
