# Maintainer: aksr <aksr at t-com dot me>
pkgname=sift-git
pkgver=r70.2ca9471
pkgrel=1
pkgdesc='A fast and powerful open source alternative to grep.'
arch=('i686' 'x86_64')
url='https://sift-tool.org/'
license=('GPL3')
makedepends=('git' 'go')
conflicts=("${pkgname%-*}" "${pkgname%-*}-bin")
source=("$pkgname::git+https://github.com/svent/sift")
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

package() {
	cd "$srcdir/$pkgname"
	install -D -m744 build/sift $pkgdir/usr/bin/sift
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
