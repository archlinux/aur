# Maintainer: James Reed <james at twiddlingbits dot net>

pkgname=cheatsheet-git
pkgver=r27.189de39
pkgrel=1
pkgdesc="A command-line cheatsheet for the command-line"
arch=('x86_64')
url="https://github.com/atlasamerican/cheatsheet"
license=('MIT')
depends=('git')
makedepends=('go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cheatsheet.install
source=("cheatsheet::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
