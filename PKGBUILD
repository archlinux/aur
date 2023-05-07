# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=sql-language-server
pkgver=1.5.1
pkgrel=1
pkgdesc="SQL Language Server"
arch=('x86_64')
url="https://github.com/joe-re/sql-language-server"
license=('MIT')
groups=()
depends=("bash" "coreutils" "nodejs")
makedepends=("npm")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(
	"https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
	"https://raw.githubusercontent.com/joe-re/$pkgname/v$pkgver/LICENSE"
)
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('c0424d11bba8f3842d3ddc731385e54cbab3b910d78113f709a109b92476ec88'
            '8515f8a196023a1806ca458e269d7108c7e4c2e4643986dca03e325177ab546f')

package() {
	cd "$srcdir"

	npm install \
		--cache "$srcdir/npm-cache" \
		--global \
		--prefix "$pkgdir/usr" \
		"$pkgname-$pkgver.tgz"

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
