# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Devin Singh <drsingh2518@icloud.com>

pkgname=bunnyfetch
pkgver=0.2.0
pkgrel=1
_commit=4acf55b
pkgdesc="Tiny system info fetch utility."
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
url="https://github.com/rosettea/bunnyfetch"
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD') ## TorchedSammy

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
	go build -o build
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

