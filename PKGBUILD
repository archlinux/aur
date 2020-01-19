# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='godbus'
_projectname='dbus'
pkgname="golang-github-$_author-$_projectname"
pkgver='5.0.3'
pkgrel='1'
pkgdesc='Native Go bindings for D-Bus'
arch=('any')
url="https://github.com/$_author/$_projectname"
license=('BSD')
depends=('go-pie>=1.12')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('49d27bde2861f5e5ab4195fddc5f38f25324aac3b32b3cc03e712cca3d2b75fa')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/github.com/$_author/$_projectname/v5"

prepare() {
	cd "$srcdir/"
  	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_projectname-$pkgver/" "$_builddir/$_buildpath/"
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
