# Maintainer: aksr <aksr at t-com dot me>
pkgname=goawk-git
pkgver=r558.01e7dd0
pkgrel=1
pkgdesc='An AWK interpreter written in Go.'
url='https://github.com/benhoyt/goawk'
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('git' 'go')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		-o "${pkgname%-*}" .
}

check() {
	cd "$srcdir/$pkgname"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go test ./...
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 goawk "$pkgdir/usr/bin/goawk"
	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
	cd docs/
	mkdir -p "$pkgdir/usr/share/doc/${pkgname%-*}/"
	install -D -m644 csv.md cover.md "$pkgdir/usr/share/doc/${pkgname%-*}/"
}
