# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron
pkgname=freezer-electron
pkgver=1.1.24
_commit=53f6b760fe21821169fdb0ee8ebe0e347bdfa44a
pkgrel=1
pkgdesc='Free music streaming client for Deezer based on the Deezloader/Deemix "bug"'
arch=(any)
url=https://gitea.dusansimic.me/dusan/freezerpc
license=(GPL3)
depends=("$_electron")
makedepends=(npm nvm)
source=("$pkgname::git+$url.git#commit=$_commit"
        "$pkgname.js"
        "$pkgname.desktop"
				"nodeezcryptor_repo.patch"
				"target.patch")
sha512sums=('SKIP'
            '3465ebf4e54b6d8632b7de06a0f36c3f4701626439ba5a05334bd083ac902fe9b935cf331c84c71189d106feb5b94e7d77da3cd8841a3d5271fae20189f8a8e6'
            '2d5b079a3dc7382f6c5f232307d3dfd88476df390fbe9e143806e65c9118c9d77f1a061a87df4c666bfe39adfd71b07ba4eb663fe92fdd895f1cd54951f8f27d'
            'f814db374d839810d293c12978e47b09b8089aac039c3c04a0b9127bd947ca4481c82d39858b4ee0edac471cf395aad9ceea9020a39f7afd6dece559d0cb8c4e'
            'f418c30f944bf0c9b9c78c6df9ae2e4c6db8a9bcebcaedef69c4fbbd7d847b4b2078a561c71d77fc01cf7692eef96f9d43b0ffdebafea9558443057478df7531')

_ensure_local_nvm() {
	# let's be sure we are starting clean
	which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
	export NVM_DIR="${srcdir}/.nvm"

	# The init script returns 3 if version specified
	# in ./.nvrc is not (yet) installed in $NVM_DIR
	# but nvm itself still gets loaded ok
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
	_ensure_local_nvm
	nvm install 16.13.1
	nvm use --delete-prefix v16.13.1

	cd "$pkgname"
	patch -p1 -i "$srcdir/nodeezcryptor_repo.patch"
	patch -p1 -i "$srcdir/target.patch"
}

build() {
	_ensure_local_nvm

	cd "$pkgname/app"
	npm install --ignore-scripts --production

	# For some reason it's not automatically built so you need to do it manually
	pushd node_modules/nodeezcryptor
	npm install
	popd

	cd client
	npm install --ignore-scripts
	npm run build

	sed -i "s~@ELECTRON@~$_electron~" "$srcdir/$pkgname.js"
	sed -i "s~@VERSION@~$pkgver~" "$srcdir/$pkgname.js"
}

package() {
	cd "$pkgname"

	_appdir="/usr/lib/$pkgname"
	install -d "$pkgdir$_appdir"
	
	for f in $(ls app | grep -v client); do
		cp -r "app/$f" "$pkgdir$_appdir"
	done
	
	install -d "$pkgdir$_appdir/client"
	cp -r app/client/dist "$pkgdir$_appdir/client/dist"

	install -Dm644 build/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

	install -Dm755 "$srcdir/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "$(realpath -m --relative-to=/usr/share/licenses/$pkgname $_appdir/LICENSE)" "$pkgdir/usr/share/licenses/$pkgname"

	find "$pkgdir$_appdir" \
		-name "package.json" \
			-exec sed -e "s|${srcdir}/${pkgname}|${appdir}|" \
				-i {} \; \
		-or -name ".*" -prune -exec rm -r '{}' \; \
		-or -name "bin" -prune -exec rm -r '{}' \; \
		-or -name "example" -prune -exec rm -r '{}' \; \
		-or -name "examples" -prune -exec rm -r '{}' \; \
		-or -name "man" -prune -exec rm -r '{}' \; \
		-or -name "scripts" -prune -exec rm -r '{}' \; \
		-or -name "test" -prune -exec rm -r '{}' \;
}
