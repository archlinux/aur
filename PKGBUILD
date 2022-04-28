# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>
# Contributor: istimaldar_sntlk <istimaldar@gmail.com>

pkgname=dolt
pkgver=0.39.4
pkgrel=1
pkgdesc='Git for data! A version controlled relational database'
arch=(x86_64)
url=https://www.dolthub.com
license=(Apache)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("https://github.com/dolthub/dolt/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1bf49730295f54b9fd252599b6f0c8707dcf0e86ac9d976e16b53d4b15a23e7a')

prepare() {
	cd "$_archive"/go
	mkdir -p build
}

build() {
	cd "$_archive"/go
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags=\"$LDFLAGS\"" \
		-o build \
		./cmd/...
}

package() {
	cd "$_archive"/go
	install -Dm0755 -t "$pkgdir/usr/bin/" build/{dolt,git-dolt,git-dolt-smudge}
}
