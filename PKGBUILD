# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='certspotter'
pkgver='0.9'
pkgrel='5'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('go-pie>=1.5' 'golang-golang-x-net' 'golang-github-mreiferson-go-httpclient')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ea377ae70a0a754c6ec07ec63d23a0fd4b41be714d9e67a8603a858edc7309fa')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/software.sslmate.com/src/$pkgname"

prepare() {
	cd "$srcdir/"
	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$pkgname-$pkgver/" "$_builddir/$_buildpath/"
}

build() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go build -v -trimpath -ldflags "-extldflags $LDFLAGS" -o "$srcdir/$pkgname-$pkgver-$pkgrel" "software.sslmate.com/src/$pkgname/cmd/$pkgname"
}

check() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go test -v "$srcdir/$_builddir/$_buildpath/..."
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel" "$pkgdir/usr/bin/$pkgname"
}
