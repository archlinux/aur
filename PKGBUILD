# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xts
pkgver=0.1.0
pkgrel=1
pkgdesc='XML typesetting system, experimental playground for speedata Publisher next generation'
arch=(x86_64)
url="https://github.com/speedata/$pkgname"
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9356b58844e3a983ec5ca8978737c233eb5a531d9699d0c3afe8417a5062cb79')

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
