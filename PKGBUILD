# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=boxesandglue-glu
pkgver=0.0.30
pkgrel=1
pkgdesc='a command line interface for boxes and glue using Lua scripting'
arch=(x86_64)
url='https://github.com/boxesandglue/glu'
license=(MIT)
depends=(glibc) # libc.so
makedepends=(go)
_archive="${pkgname#*-}-$pkgver"
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('8a74651b99738bf3937a7c60b46cb6794f32b8237447b33739a86305a731b2b2')

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
		-ldflags "-X main.Version=$pkgver -extldflags \"$LDFLAGS\"" \
		-o build \
		./...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" build/glu
}
