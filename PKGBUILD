# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='atotto'
_projectname='clipboard'
pkgname="golang-github-$_author-$_projectname"
pkgver='0.1.2'
pkgrel='1'
pkgdesc='Clipboard for Go'
arch=('any')
url="https://github.com/$_author/$_projectname"
license=('BSD')
depends=('go-pie')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('84704a60eb4de90eaebe6e8cbfab30bb53d103c26c25560d67d13469fd17934e')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/github.com/$_author/$_projectname"

prepare() {
	cd "$srcdir/"
	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_projectname-$pkgver/" "$_builddir/$_buildpath/"
	rm -r "$_builddir/$_buildpath/go.mod"
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
