# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Artur Juraszek <artur@juraszek.xyz>
# Contributor: istimaldar_sntlk <istimaldar@gmail.com>

pkgname=dolt
pkgver=0.40.1
pkgrel=1
pkgdesc='Git for data! A version controlled relational database'
arch=(x86_64)
url=https://www.dolthub.com
license=(Apache)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("https://github.com/dolthub/dolt/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('1d17c9bd9857be3cf6a17210f90724b8b0caf80233e170b621b35f1556c58ef9')

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
