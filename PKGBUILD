# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certspotter'
pkgver='0.15.1'
pkgrel='1'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('go>=1.19' 'lowdown')
install="$pkgname.install"
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('b814b09385666b5269fc5b09131f9917a85ad7489954ea2a5451f272d9c623f29983c63f4d33377f4a936a9324003db4877e786b6029a7e3467e8e4f67a8648c')

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
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-X=main.Version=v$pkgver"
	go build -v -o "$srcdir/$_bindir/" './...'

	# Build man pages
	cd "$srcdir/$_sourcedirectory/man/"
	make all
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-X=main.Version=v$pkgver"
	go test -v './...'
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/bin/"
	install -Dm755 "$_bindir/"* "$pkgdir/usr/bin/"

	install -dm755 "$pkgdir/usr/share/man/man8/"
	install -Dm644 "$_sourcedirectory/man/"*'.8' "$pkgdir/usr/share/man/man8/"
}
