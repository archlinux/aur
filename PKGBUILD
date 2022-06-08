# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certspotter'
pkgver='0.12'
pkgrel='1'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('go>=1.5')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c4453c98e6680f5c62c1dc693c9dd14cf73bbc80b397b1dd958218e1a4c44b5523c04c8deadde1002bc1cd82f88ad7a41bd47adb1d15a975a3988e05bb78167f')

_sourcedirectory="$pkgname-$pkgver"
_bindir="$pkgname-$pkgver-$pkgrel-bin"
_gopath="$pkgname-$pkgver-$pkgrel-gopath"

prepare() {
	mkdir -p "$srcdir/$_bindir/"
	mkdir -p "$srcdir/$_gopath/"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -v -o "$srcdir/$_bindir/" './...'
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go test -v './...'
}

package() {
	cd "$srcdir/"
	for _binary in "$pkgname" 'ctparsewatch' 'submitct'; do
		install -Dm755 "$_bindir/$_binary" "$pkgdir/usr/bin/$_binary"
	done
}
