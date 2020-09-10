# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=uva-tool-git
pkgver=r48.ac7e52e
pkgrel=2
epoch=
pkgdesc="Command Line Based UVa OJ Submitting and uHunting Tool"
arch=('x86_64')
url="https://github.com/arafat-hasan/uva-tool"
license=('MIT')
groups=()
depends=('curl')
makedepends=('git' 'cmake')
checkdepends=()
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"

	# Update onlinejudge link
	sed -i "s/uva\.//g" src/${pkgname%-git}.cpp
}

pkgver() {
	cd "$srcdir/$pkgname"

	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$pkgname"

	g++ $CXXFLAGS $LDFLAGS -flto src/${pkgname%-git}.cpp -o ${pkgname%-git}
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 ${pkgname%-git} -t "$pkgdir/usr/bin"
	install -Dm644 pid-to-num.cvs -t "$pkgdir/usr/share/${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
