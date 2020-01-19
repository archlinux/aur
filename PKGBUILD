# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='errgo.v2'
pkgname="golang-gopkg-$_projectname"
pkgver='2.1.0'
pkgrel='1'
pkgdesc='Dependable Go errors with tracebacks'
arch=('any')
url="https://github.com/go-errgo/errgo"
license=('BSD')
depends=('go-pie' 'golang-gopkg-check.v1')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f6b10d77db65cb5a6c425be0f695e43b98e3e10ec83340209ac5bf4bf5c1b837')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/gopkg.in/$_projectname"

prepare() {
	cd "$srcdir/"
  	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "errgo-$pkgver/" "$_builddir/$_buildpath/"
	rm -r "$_builddir/$_buildpath/go."{mod,sum}
}

check() {
	export GOPATH="$srcdir/$_builddir:/usr/share/gocode"
	go test -v "$srcdir/$_builddir/$_buildpath/..."
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/share/gocode/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	cp -r --no-preserve=ownership --preserve=mode "$_builddir/$_buildpath/" "$pkgdir/usr/share/gocode/$_buildpath/"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sf "/usr/share/gocode/$_buildpath/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
