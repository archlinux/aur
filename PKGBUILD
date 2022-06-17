# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: jbpratt <jbpratt78 at gmail dot com>

pkgname=sourcegraph-cli
pkgver=3.40.11
pkgrel=1
pkgdesc='Command line interface to Sourcegraph'
url='https://github.com/sourcegraph/src-cli'
arch=('x86_64' 'aarch64')
license=('APACHE')
depends=('glibc')
makedepends=('go' 'git')
provides=('src-cli')
conflicts=('src-cli')
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build ./cmd/src
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D build/src -t "$pkgdir/usr/bin/"
	ln -s /usr/bin/src "$pkgdir/usr/bin/src-cli"
	install -Dm644 README.markdown -t "$pkgdir/usr/share/doc/$pkgname/"
}
