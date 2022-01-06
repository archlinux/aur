# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: John D Jones III (jnbek) <https://aur.archlinux.org/account/jnbek>

_npmname=jshint
pkgname=nodejs-$_npmname
pkgver=2.13.3
pkgrel=1
pkgdesc='Static analysis tool for JavaScript'
arch=(any)
url=https://jshint.com/
license=(MIT)
depends=(nodejs)
makedepends=(jq
             moreutils
             npm)
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('b6e9897134aac532cae572615ff091d4cc643f5f3711bc71dd88054cda005795')
noextract=("${source[@]##*/}")

package() {
	npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
	find "$pkgdir"/usr -type d -exec chmod 755 {} +
	find "$pkgdir" -type f -name package.json \
		-execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
	chown -R root:root "$pkgdir"
}
