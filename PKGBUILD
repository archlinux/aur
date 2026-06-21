# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=git-pages-cli
pkgdesc='Command line application for publishing sites to git-pages'
pkgver=1.10.0
pkgrel=1
url=https://codeberg.org/git-pages/git-pages-cli
license=(0BSD)
arch=(x86_64)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0ac04e1dd03a3d3325c6332e28f392c8e89911b297aca44bffc1439f1c60a478')

prepare () {
	export GOPATH="$srcdir"

	cd "$pkgname"
	go mod download -modcacherw
}

build () {
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
	export GOPATH="$srcdir"

	cd "$pkgname"
	go build -v -o git-pages-cli -ldflags '-linkmode=external -compressdwarf=false' .
}

package () {
	cd "$pkgname"
	install -Dm755 git-pages-cli "$pkgdir/usr/bin/git-pages-cli"
}
