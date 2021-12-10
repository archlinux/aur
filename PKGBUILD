# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nikolay Arhipovs <nikolajs.arhipovs@gmail.com>

pkgname=wuzz-git
pkgver=0.5.0.r2.g66176b6
pkgrel=1
pkgdesc="Interactive CLI tool for HTTP inspection"
arch=('x86_64' 'i686' 'arm')
url="https://github.com/asciimoo/wuzz"
license=('AGPL3')
depends=('glibc')
makedepends=('go' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=("SKIP")

pkgver() {
	git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
	cd "$pkgname"
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build/
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D build/wuzz -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
