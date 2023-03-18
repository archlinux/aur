# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xts
pkgver=0.0.1
pkgrel=1
pkgdesc='XML typesetting system, experimental playground for speedata Publisher next generation'
arch=(x86_64)
url="https://github.com/speedata/$pkgname"
license=(AGPL3)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e28b1401e4e2b863a2d33e45acb98e20c9cace2e6476befc7f54705685d5879c')

prepare() {
	cd "$_archive"
	mkdir -p build
}

build() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"$LDFLAGS\"" \
		-o build \
		./...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "build/$pkgname"
}
