# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=klog-time-tracker
_pkgname=klog
pkgver=6.3
pkgrel=1
pkgdesc='A plain-text file format and a command line tool for time tracking'
arch=(x86_64)
url="https://github.com/jotaen/$_pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go
             git)
conflicts=(klog)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('f45c6ed67af572b4237a6eb88f9435bd4d59425e07b0924f00b731a8815b0d67')

prepare() {
	cd "$_archive"
	go get -t ./...
	go mod tidy
	mkdir -p dist
}

build() {
	local _commit=$(zcat ${source[0]##*/} | git get-tar-commit-id)
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	go build -o dist -v \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags '$LDFLAGS' \
			-X main.BinaryVersion=v$pkgver -X main.BinaryBuildHash=${_commit::7}" \
		./...
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "dist/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
