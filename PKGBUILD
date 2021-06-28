# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=sql-language-server
pkgver=0.12.0
pkgrel=2
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
sha256sums=('3e9db41e2e50330519d3897dd99afef1aabfbe1be1f2d21478019550df02aa50' 'SKIP')

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
