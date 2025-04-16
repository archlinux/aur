# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=star-tex
pkgver=0.7.1
pkgrel=3
pkgdesc='a TeX engine in Go'
arch=(x86_64)
url="https://git.sr.ht/~sbinet/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
confilcts=(texlive-bin)
options=(!lto)
_archive="$pkgname-v$pkgver"
source=("$_archive.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08280c00a8d92ba556f92819c2e1a4b2412fa1535f78c96f52d6656d2a844f88')

prepare() {
	cd "$_archive"
	mkdir -p dist
	go mod download
}

build() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	go build -v \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
		-o dist \
		./cmd/...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" dist/*
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
