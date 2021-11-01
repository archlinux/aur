# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=sourcegraph-cli
pkgver=3.33.5
pkgrel=1
pkgdesc="A command line interface to Sourcegraph"
url="https://github.com/sourcegraph/src-cli"
arch=("x86_64" "aarch64")
license=("APACHE")
depends=('glibc')
makedepends=('go')
checkdepends=('git')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e7811e874f3b48a003054a2ee6a1fde67ba394be110e21a63d45bd4ac7ef90ef')

prepare() {
	cd "src-cli-$pkgver"
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "src-cli-$pkgver"
	go build -o build ./cmd/src
}

check() {
	cd "src-cli-$pkgver"
	go test ./...
}

package() {
	cd "src-cli-$pkgver"
	install -D build/src -t "$pkgdir/usr/bin/"
	ln -s /usr/bin/src "$pkgdir/usr/bin/src-cli"
	install -Dm 644 README.markdown -t "$pkgdir/usr/share/doc/$pkgname/"
}
