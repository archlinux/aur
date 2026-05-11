# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=jjui
pkgver=0.10.5
pkgrel=1
pkgdesc='TUI designed for interacting with the Jujutsu version control system'
arch=(x86_64)
url="https://github.com/idursun/$pkgname"
license=(MIT)
depends=(glibc
         jujutsu)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0369e07b2aaf52a05d32bb11479fdf314aff19e41d6ebc8facb83340ebc4e2bc')

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
		"./cmd/$pkgname"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "dist/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
