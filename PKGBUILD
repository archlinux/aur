# Maintainer: aliu <aaron! liu! 0130! at! gmail! dot! com! woohoo>
pkgname=ipatool
pkgver=2.3.1
pkgrel=1
pkgdesc="Command-line tool that allows searching and downloading app packages (known as ipa files) from the iOS App Store"
arch=('x86_64' 'aarch64')
url="https://github.com/majd/ipatool"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('c5a5154b79c4909b7fc3633fd7da78ccb7dfcd5ce6c599854acdc82945cc0db2d3881d18b535b04490b0847ce311bded234f583b27814897ba2e22e40ff62daf')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$srcdir/$pkgname-$pkgver"
	go build -o $pkgname .
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	go generate ./...
	go test -v ./...
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 ./$pkgname "$pkgdir"/usr/bin/$pkgname
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}
