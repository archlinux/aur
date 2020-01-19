# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='certspotter'
pkgname="$_pkgname-git"
pkgver='0.9.r17.ge74cb79'
pkgrel='2'
pkgdesc='Certificate Transparency Log Monitor - git version'
arch=('x86_64')
url="https://github.com/SSLMate/$_pkgname"
license=('MPL2')
makedepends=('git' 'go-pie>=1.5' 'golang-golang-x-net' 'golang-github-mreiferson-go-httpclient')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/software.sslmate.com/src/$_pkgname"

prepare() {
	cd "$srcdir/"
	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$pkgname/" "$_builddir/$_buildpath/"
}

pkgver() {
	cd "$srcdir/$_builddir/$_buildpath/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go build -v -trimpath -ldflags "-extldflags $LDFLAGS" -o "$srcdir/$pkgname-$pkgver-$pkgrel" "software.sslmate.com/src/$_pkgname/cmd/$_pkgname"
}

check() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go test -v "$srcdir/$_builddir/$_buildpath/..."
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver-$pkgrel" "$pkgdir/usr/bin/$_pkgname"
}
