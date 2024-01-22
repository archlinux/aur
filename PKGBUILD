# Maintainer: aksr <aksr at t-com dot me>
pkgname=de-git
pkgver=r153.0efad91
pkgrel=1
pkgdesc="A Programmer's Text Editor"
arch=('i686' 'x86_64')
url='https://github.com/driusan/de'
license=('MIT')
makedepends=('git' 'go')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	go mod init "${url#https://}"
	go mod tidy
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	mkdir -p build/
	go build -v -o build .
}

check() {
	cd "$srcdir/$pkgname"
	go test -v -o build .
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 build/de "$pkgdir/usr/bin/de"
	install -D -m644 COMMANDS.md $pkgdir/usr/share/doc/${pkgname%-*}/COMMANDS.md
	install -D -m644 PLUGINS.md $pkgdir/usr/share/doc/${pkgname%-*}/PLUGINS.md
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 USAGE.md $pkgdir/usr/share/doc/${pkgname%-*}/USAGE.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
