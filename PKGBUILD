# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=gyosu
pkgname=${_base}-git
pkgver=r105.0f3a93c
pkgrel=1
pkgdesc="Simple C documentation generator"
arch=(x86_64)
url="https://codeberg.org/emersion/${_base}"
license=(AGPL-3.0-only)
depends=(glibc)
makedepends=(git go)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
	cd ${_base}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${_base}
	mkdir -p build
	go mod tidy
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd ${_base}
	go build -o build -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

check() {
	cd ${_base}
	go test ./...
}

package() {
	cd ${_base}
	install -D build/gyosu -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find template \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}
