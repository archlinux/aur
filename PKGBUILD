# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='certspotter'
pkgver='0.10'
pkgrel='2'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('go>=1.5')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-missing-printf.diff::$url/commit/6d5e2395a13267cbcc5813091586fe6d6a6c37cf.diff"
)
sha256sums=('8c740cb24ac2a7ae83d395ea930c83e1a699f0c317369deeefb104de61981fdc'
            '7e6334317092f60d102e4ee4b536565f1417871d2070607cd272cf8dd9a39c60')

_sourcedirectory="$pkgname-$pkgver"
_bindir="$pkgname-$pkgver-$pkgrel-bin"
_gopath="$pkgname-$pkgver-$pkgrel-gopath"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# https://github.com/SSLMate/certspotter/pull/40
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-fix-missing-printf.diff"

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
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	go mod init "software.sslmate.com/src/$pkgname"
	go mod tidy
	export GOFLAGS="$GOFLAGS -mod=readonly"
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
