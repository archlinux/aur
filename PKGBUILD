# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Bruno Galeotti <bgaleotti at gmail dot com>

pkgname=clocker
pkgver=1.20.5
pkgrel=1
pkgdesc='Tracks project hours'
arch=('x86_64' 'i686' 'arm' 'armv6' 'armv7h' 'aarch64')
url="https://github.com/substack/clocker"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
replaces=('nodejs-clocker')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('6d7a932d0c5a16fc818f8dacdac4ff1c901a6194a219603cd956efa5eef1ca27')

package() {
	export NODE_ENV=production

	npm install -g --build-from-source --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	npm prune
	install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"

	### cleanup ###
	pushd "$pkgdir/usr/lib/node_modules/$pkgname/"
	rm LICENSE README.md
	pushd node_modules/leveldown
	rm -rf prebuilds/ deps/ build/Release/{obj.target,.deps}
	popd
	find node_modules -type f \( -name '*.o' -or -name '*.o.d' -or -name '*.md' \) -delete
	chown -R root:root "$pkgdir/"
}
