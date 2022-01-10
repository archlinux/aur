# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gyosu-git
pkgver=r28.aa9b8e1
pkgrel=2
pkgdesc="Simple C documentation generator"
arch=('x86_64')
url="https://git.sr.ht/~emersion/gyosu"
license=('AGPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build -ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D build/gyosu -t "$pkgdir/usr/bin/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find template \
		-type f -exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
}
