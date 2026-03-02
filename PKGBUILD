# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Callum Parsey <callum@neoninteger.au>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yufan You <ouuansteve at gmail>

pkgname=dockerfile-language-server
pkgver=0.15.0
pkgrel=2
pkgdesc='Language server for Dockerfiles'
arch=('any')
url='https://github.com/rcjsuen/dockerfile-language-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('d0701685e423547bff35c7c1fc56d7250d62e4ed7a6ae77d6bc506b99cd2503c9f7e2bd99807d04d0d2705e764d43fe4d3ad7767fe528a80c78fe6bb9e6f6bac')

prepare() {
	cd $pkgname
	npm install
}

build() {
	cd $pkgname
	npm run build
}

check() {
	cd $pkgname
	npm test
}

package() {
	cd $pkgname

	local mod_dir=/usr/lib/node_modules/$pkgname
	install -d "${pkgdir}${mod_dir}"

	cp -r out/src "${pkgdir}${mod_dir}/lib"
	cp -r package.json bin node_modules "${pkgdir}${mod_dir}/"

	install -d "$pkgdir/usr/bin/"
	ln -s "$mod_dir/bin/docker-langserver" "$pkgdir/usr/bin/docker-langserver"
	chmod 755 "$pkgdir/usr/lib/node_modules/$pkgname/bin/docker-langserver"

	install -Dm644 License.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 OriginalLicense.txt "$pkgdir/usr/share/licenses/$pkgname/ORIGINAL_LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
