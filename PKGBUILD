# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certspotter'
pkgver='0.16.0'
pkgrel='1'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('go>=1.19' 'lowdown')
install="$pkgname.install"
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('418647a317b240bf7bf6589b7596045e2ef18001a97badc1f2eedd962f841696292792c005e6c3b75198e8457679e78f3f95380805b335f28038eb25f929052b')

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

	# Binaries
	install -dm755 "$pkgdir/usr/bin/"
	install -Dm755 "$_bindir/"* "$pkgdir/usr/bin/"

	# Man pages
	install -dm755 "$pkgdir/usr/share/man/man8/"
	install -Dm644 "$_sourcedirectory/man/"*'.8' "$pkgdir/usr/share/man/man8/"
}
