# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=zq
pkgver=1.18.0
pkgrel=1
pkgdesc='Tooling for super-structured data'
arch=(x86_64)
url='https://zed.brimdata.io/'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(go)
options=(!lto)
_archive="zed-$pkgver"
source=("https://github.com/brimdata/zed/archive/v$pkgver/zq-$_archive.tar.gz")
sha256sums=('ad26518d589f565a3859177066a2ad08f067910fa204a51436a55af837198175')

prepare() {
	cd "$_archive"
	mkdir dist
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
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\" \
		  -X github.com/brimdata/zed/cli.Version=$pkgver" \
		-o dist \
		./cmd/{zed,zq}
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" dist/{zq,zed}
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
