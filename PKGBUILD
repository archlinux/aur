# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=xts
pkgver=0.0.13
pkgrel=1
pkgdesc='XML typesetting system, experimental playground for speedata Publisher next generation'
arch=(x86_64)
url="https://github.com/speedata/$pkgname"
license=(AGPL3)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('7df9fdf6922f131e8db6253acb875288e11e3af31bdbff0acc9253671a8d092a')

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
