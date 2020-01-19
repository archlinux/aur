# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='knq'
_projectname='ini'
pkgname="golang-github-$_author-$_projectname"
pkgver='20191206'
_commit='58b5e74713e005e3eb460c354a1514c63a486cd0'
pkgrel='1'
pkgdesc='ini file manipulation / parser package for Go'
arch=('any')
url="https://github.com/$_author/$_projectname"
license=('MIT')
depends=('go-pie>=1.13')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('8e63678527afa6e566c6ad6fc3d551daee6d89b2b36e7cf95fd8221f420b7656')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/github.com/$_author/$_projectname"

prepare() {
	cd "$srcdir/"
	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_projectname-$_commit/" "$_builddir/$_buildpath/"
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
