pkgname=duck-gen
_fragment=tag=v0.6
pkgver=0.6
pkgrel=1
pkgdesc='Generate DuckDuckGo Email Protection addresses from the command-line'
arch=('x86_64')
license=('MIT')
url='https://github.com/chowder/duck-gen'
source=("git+$url.git#$_fragment")
makedepends=(git go)
sha1sums=('025beaaee779265f532fe09300c8dc7b11ed9d17')

pkgver() {
	git -C $pkgname describe --first-parent --tags | sed 's/^v//; s/-/+/g'
}

prepare() {
	mkdir -p build
}

build() {
	cd $pkgname

	export GOPATH=$srcdir/go
	export GOCACHE=$srcdir/go/cache
	export CGO_CPPFLAGS=$CPPFLAGS
	export CGO_CFLAGS=$CFLAGS
	export CGO_CXXFLAGS=$CXXFLAGS
	export CGO_LDFLAGS=$LDFLAGS
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o ../build .
}

package() {
	install -Dm0755 -t "$pkgdir/usr/bin"                     build/$pkgname
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSE
}
