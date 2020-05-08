# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='knq'
_projectname='ini'
pkgname="golang-github-$_author-$_projectname"
pkgver='20200508'
_commit='ad6e8e8848b545897dfa39c3a602f382a666371e'
pkgrel='1'
pkgdesc='ini file manipulation / parser package for Go'
arch=('any')
url="https://github.com/$_author/$_projectname"
license=('MIT')
depends=('go-pie>=1.13')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('e14ad1bcf2ee5da51cf44ff62c6ef7df6f559ccf6553b79c362e2866f0758d45')

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
