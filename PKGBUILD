# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=jjui
pkgver=0.9.7
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
sha256sums=('ba400c7c7fa6ea490ba271895cc8aabba409004b690040f8de69fe625e09b546')

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
