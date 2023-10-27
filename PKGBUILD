# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='certspotter'
pkgver='0.17.0'
pkgrel='1'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('go>=1.21' 'lowdown')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('5d12007e99cea1c8f84bcef60092e51209a96cb79ad335c64868e97d8ed32c9104a29d7de16a875bcef687e1c47bc7b3c0723e36b364e42b9ef47a30bdb587cd')

_sourcedirectory="$pkgname-$pkgver"
_bindir="$pkgname-$pkgver-bin"
_gopath="$pkgname-$pkgver-gopath"

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
	export GOFLAGS="-buildmode=pie -trimpath '-ldflags=-X=main.Version=v$pkgver -linkmode=external' -mod=readonly -modcacherw"
	go build -v -o "$srcdir/$_bindir/" './...'

	# Build man pages
	cd "$srcdir/$_sourcedirectory/man/"
	make all
}

check() {
	cd "$srcdir/$_sourcedirectory/"
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
