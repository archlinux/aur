# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=ratt-git
pkgver=r85.eac7e14
pkgrel=1
pkgdesc="A tool for converting websites to RSS/Atom feeds"
arch=('x86_64')
url="https://git.sr.ht/~ghost08/ratt"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'scdoc')
options=('!emptydirs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	make
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname"
	go test ./...
}

package() {
	cd "$pkgname"
	make install PREFIX=/usr DESTDIR="$pkgdir/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find confs -type f -exec install -Dm644 -t "$pkgdir/usr/share/$pkgname/" '{}' \+
}
