# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='certspotter'
pkgname="$_pkgname-git"
pkgver='0.9.r17.ge74cb79'
pkgrel='3'
pkgdesc='Certificate Transparency Log Monitor - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$_pkgname"
license=('MPL2')
makedepends=('git' 'go-pie>=1.5' 'golang-github-mreiferson-go-httpclient' 'golang-golang-x-net')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_builddir="$pkgname-build"
_buildpath="src/software.sslmate.com/src/$_pkgname"
_bindir="$pkgname-bin"

prepare() {
	cd "$srcdir/"

	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$pkgname/" "$_builddir/$_buildpath/"

	mkdir -p "$_bindir/"
}

pkgver() {
	cd "$srcdir/$_builddir/$_buildpath/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
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
	for _binary in "$_pkgname" 'ctparsewatch' 'submitct'; do
		install -Dm755 "$_bindir/$_binary" "$pkgdir/usr/bin/$_binary"
	done
}
