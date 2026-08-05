# Maintainer: aliu <aaron! liu! 0130! at! gmail! dot! com! woohoo>
pkgname=ipatool
pkgver=2.3.2
pkgrel=1
pkgdesc="Command-line tool that allows searching and downloading app packages (known as ipa files) from the iOS App Store"
arch=('x86_64' 'aarch64')
url="https://github.com/majd/ipatool"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('af8fba357e6942f738ff88cf967b4c56fe7afd1e4b46c8199e0b6058e337ca3a47b6e81113e09c59cb93c5ab871bf04ef514f5660be013bf7439b3b7c9934812')

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
