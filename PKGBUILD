# Maintainer: aksr <aksr at t-com dot me>
pkgname=now-git
pkgver=r13.5a84890
pkgrel=1
pkgdesc='Convenient global date printer'
arch=('i686' 'x86_64')
url='https://github.com/robpike/now'
license=('BSD')
makedepends=('git' 'go>=1.5')
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
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	mkdir -p build/
	go build -v -o build .
}

#check() {
#	cd "$srcdir/$pkgname"
#	go test -v -o build .
#}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 build/now "$pkgdir/usr/bin/now"
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
