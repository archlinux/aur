# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=dnsometer
appname=dnsometer
pkgver=0.1.0
pkgrel=1
pkgdesc="DNS latency testing with CLI and optional JSON output"
arch=('x86_64')
url="https://gitlab.com/nathanchere/dnsometer"
license=('MIT')
depends=('ca-certificates')
makedepends=('go>=1.25' 'git' 'make')
source=("${appname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!strip' '!emptydirs')

prepare() {
	cd "$srcdir/$appname"
	go mod download
}

build() {
	cd "$srcdir/$appname"
	CGO_ENABLED=0 make build VERSION="v${pkgver}"
}

check() {
	cd "$srcdir/$appname"
	CGO_ENABLED=0 go test ./...
	CGO_ENABLED=0 go vet ./...
}

package() {
	cd "$srcdir/$appname"
	install -Dm755 bin/dnsometer "$pkgdir/usr/bin/dnsometer"
	install -Dm644 resolvers.yaml "$pkgdir/usr/share/$pkgname/resolvers.yaml"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
