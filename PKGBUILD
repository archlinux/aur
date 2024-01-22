# Maintainer: aksr <aksr at t-com dot me>
pkgname=mk-git
pkgver=r49.73d1b31
pkgrel=2
pkgdesc='A reboot of the Plan 9 mk command.'
arch=('i686' 'x86_64')
url='https://github.com/dcjones/mk'
license=('BSD')
makedepends=('git' 'go')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
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

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 build/mk "$pkgdir/usr/bin/mk"
	install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
