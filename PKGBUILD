# Maintainer: aksr <aksr at t-com dot me>
pkgname=codesearch-git
pkgver=r42.b34f2a0
pkgrel=1
pkgdesc='A tool for indexing and then performing regular expression searches over large bodies of source code.'
arch=('i686' 'x86_64')
url='https://github.com/google/codesearch'
license=('BSD-3-Clause')
makedepends=('git' 'go')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

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
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -tags=opt_select,no_cgo"
	go build -v -o build/ ./cmd/...
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin/"
	install -m755 build/* "$pkgdir/usr/bin/"
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
