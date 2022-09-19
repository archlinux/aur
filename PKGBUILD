# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=clocker
pkgver=1.23.0
pkgrel=1
pkgdesc='Tracks project hours'
arch=('x86_64' 'i686' 'arm' 'armv6' 'armv7h' 'aarch64')
url="https://github.com/substack/clocker"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
replaces=('nodejs-clocker')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('88d8ad43a14cbf9525a93484b4a4ca7d4c5c632d28eb884096ca70c0b56afe17')

PURGE_TARGETS=('.travis.yml')

package() {
	export NODE_ENV=production

	npm install -g --build-from-source --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"
	ln -s "/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/"

	### cleanup ###
	cd "$pkgdir/usr/lib/node_modules/$pkgname/"
	find node_modules -type f \( -name '*.o' -or -name '*.o.d' -or -name '*.md' \) -delete
	cd node_modules/classic-level
	rm -rf prebuilds/ deps/ build/Release/{obj.target,.deps}
	chown -R root:root "$pkgdir/"
}
