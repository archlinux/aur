# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xts
pkgver=0.0.17
pkgrel=1
pkgdesc='XML typesetting system, experimental playground for speedata Publisher next generation'
arch=(x86_64)
url="https://github.com/speedata/$pkgname"
license=(AGPL3)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6651d65ee5f13b1a3339f19dff8035dd3099de8e605cd86ad553d0ad94f3eafd')

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
		-ldflags "-X github.com/speedata/xts/core.Version=$pkgver -extldflags \"$LDFLAGS\"" \
		-o build \
		./...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "build/$pkgname"
}
