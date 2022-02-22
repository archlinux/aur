# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Devin Singh <drsingh2518@icloud.com>

pkgname=bunnyfetch-git
pkgver=0.2.0.r5.g96403ef
pkgrel=1
pkgdesc="Tiny system info fetch utility"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Rosettea/bunnyfetch"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('bunnyfetch')
conflicts=('bunnyfetch')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('784DF7A14968C5094E16839C904FC49417B44DCD') ## TorchedSammy

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

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
	install -D build/bunnyfetch -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
