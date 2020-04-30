# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='certspotter'
pkgver='0.10'
pkgrel='1'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('go-pie>=1.5' 'golang-github-mreiferson-go-httpclient' 'golang-golang-x-net')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-fix-missing-printf.diff::$url/commit/6d5e2395a13267cbcc5813091586fe6d6a6c37cf.diff"
)
sha256sums=('8c740cb24ac2a7ae83d395ea930c83e1a699f0c317369deeefb104de61981fdc'
            '7e6334317092f60d102e4ee4b536565f1417871d2070607cd272cf8dd9a39c60')

_sourcedirectory="$pkgname-$pkgver"
_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/software.sslmate.com/src/$pkgname"
_bindir="$pkgname-$pkgver-$pkgrel-bin"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# https://github.com/SSLMate/certspotter/pull/40
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-fix-missing-printf.diff"

	cd "$srcdir/"
	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_sourcedirectory/" "$_builddir/$_buildpath/"

	mkdir -p "$_bindir/"
}

build() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go build -v -trimpath -ldflags "-extldflags $LDFLAGS" -o "$srcdir/$_bindir/" "$(echo "$_buildpath" | cut -d '/' -f 2-)/..."
}

check() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go test -v "$srcdir/$_builddir/$_buildpath/..."
}

package() {
	cd "$srcdir/"
	for _binary in "$pkgname" 'ctparsewatch' 'submitct'; do
		install -Dm755 "$_bindir/$_binary" "$pkgdir/usr/bin/$_binary"
	done
}
