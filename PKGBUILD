# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gqlclient-git
pkgver=r28.d5fe5ef
pkgrel=1
pkgdesc="GraphQL client and code generator"
arch=('x86_64')
url="https://git.sr.ht/~emersion/gqlclient"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("${pkgname%-git}" 'gqlclientgen')
conflicts=("${pkgname%-git}" 'gqlclientgen')
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
	go mod verify
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go build -o build -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" ./...
}

check() {
	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	install -D build/gqlclient{,gen} -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
