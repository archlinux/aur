# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='rsc'
_projectname='2fa'
pkgname="golang-$_author-$_projectname"
pkgver='1.1.0'
pkgrel='1'
pkgdesc='Two-factor authentication on the command line using Go'
arch=('any')
url="https://github.com/$_author/$_projectname"
license=('BSD')
depends=('go-pie' 'golang-github-atotto-clipboard')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ecd5ba067d3e3bbc3f8c10fa2df01b1b388b1cd6503fb56381573d8d17497755')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/rsc.io/$_projectname"

prepare() {
	cd "$srcdir/"
  	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_projectname-$pkgver/" "$_builddir/$_buildpath/"
	rm -r "$_builddir/$_buildpath/vendor"
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
