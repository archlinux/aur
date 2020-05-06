# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='rogpeppe'
_projectname='go-internal'
pkgname="golang-github-$_author-$_projectname"
pkgver='1.6.0'
pkgrel='1'
pkgdesc='Selected Go-internal packages factored out from the standard library'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/$_author/$_projectname"
license=('BSD')
depends=('go-pie>=1.11' 'golang-gopkg-errgo.v2>=2.1.0')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('62cb775eddd7efb11f2f936ab878a6f5d6f4cfacbc301e03c09d09f903974f04')

_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/github.com/$_author/$_projectname"
_bindir="$pkgname-$pkgver-$pkgrel-bin"

prepare() {
	cd "$srcdir/"

	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_projectname-$pkgver/" "$_builddir/$_buildpath/"
	rm -r "$_builddir/$_buildpath/go."{'mod','sum'}

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

	install -dm755 "$pkgdir/usr/share/gocode/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	cp -r --no-preserve=ownership --preserve=mode "$_builddir/$_buildpath/" "$pkgdir/usr/share/gocode/$_buildpath/"

	for _binary in 'testscript' 'txtar-addmod' 'txtar-c' 'txtar-goproxy' 'txtar-x'; do
		install -Dm755 "$_bindir/$_binary" "$pkgdir/usr/bin/$_binary"
	done

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sf "/usr/share/gocode/$_buildpath/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
