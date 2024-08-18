pkgname=duck-gen
_fragment=tag=v0.5
pkgver=0.5
pkgrel=1
pkgdesc='Generate DuckDuckGo Email Protection addresses from the command-line'
arch=('x86_64')
license=('MIT')
url='https://github.com/chowder/duck-gen'
source=("$pkgname::git+$url.git#$_fragment")
makedepends=(git go)
sha1sums=('b6b33f5867ea5637917ff8b27809d9357279b637')

pkgver() {
	cd $pkgname

	git describe --tags --long | sed 's/^v//; s/-0-[[:alnum:]]*$//; s/-/+/g'
}

prepare() {
	cd $pkgname

	mkdir -p build
}

build() {
	cd $pkgname

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build -o build .
}

package() {
	cd $pkgname

	install -Dm0755 -t "$pkgdir/usr/bin/" build/$pkgname
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
