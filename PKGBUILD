# Maintainer: aliu <aaron! liu! 0130! at! gmail! dot! com! woohoo>
pkgname=ipatool
pkgver=2.3.0
pkgrel=1
pkgdesc="Command-line tool that allows searching and downloading app packages (known as ipa files) from the iOS App Store"
arch=('x86_64' 'aarch64')
url="https://github.com/majd/ipatool"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('36c589ad88cea989b3a5bc3cd35223e12907c609789802b59d3cfb07596a07e7')

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
