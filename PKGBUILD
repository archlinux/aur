# Maintainer: éclairevoyant

pkgname=fx_cast
pkgver=0.3.1
pkgrel=1
pkgdesc="Chromecast API implementation for Firefox"
arch=(x86_64)
url="https://hensm.github.io/fx_cast/"
license=(MIT)
depends=(avahi gcc-libs glibc nodejs nss-mdns)
makedepends=(npm nvm)
options=('!strip')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/hensm/$pkgname/archive/v$pkgver.tar.gz")
b2sums=('b050f886388ae9fdecf3e4664fd4c5732cd42cbc5f42e494eb79f6f85c39f1ae6ec38aee6c7c73f95abd85944ce94c1c8fd75166e7e950b75da937c5f65ce4a7')

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
	cd $pkgname-$pkgver/app

	nvm install 16
	npm install --cache "$srcdir/npm-cache"
	sed -i '/: path\.join/a manifest.path = "/usr/lib/fx_cast/fx_cast_bridge"' bin/build.js
}

build() {
	_ensure_local_nvm
	cd $pkgname-$pkgver/app
	npm run build -- --usePkg
}

package() {
	_ensure_local_nvm
	cd $pkgname-$pkgver

	install -Dm755 dist/app/{dns_sd_bindings.node,fx_cast_bridge} -t "$pkgdir/usr/lib/fx_cast/"
	install -Dm644 dist/app/fx_cast_bridge.json -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
