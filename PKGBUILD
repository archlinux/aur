# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_author='swaywm'
_projectname='go-wlroots'
pkgname="golang-github-$_author-$_projectname"
pkgver='20200121'
_commit='0646c28e8eb84a463af2bcfe424122b28dd5e565'
pkgrel='1'
pkgdesc='Go binding for wlroots'
arch=('any')
url="https://github.com/$_author/$_projectname"
license=('BSD')
depends=('go-pie>=1.8' 'wayland' 'wlroots>=0.9.0')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('e30f45cf794c48c70841321ed02af651b22c9cf47623fd7bb21defe1a1ed444e')

_sourcedirectory="$_projectname-$_commit"
_builddir="$pkgname-$pkgver-$pkgrel-build"
_buildpath="src/github.com/$_author/$_projectname"
_bindir="$pkgname-$pkgver-$pkgrel-bin"

prepare() {
	cd "$srcdir/"

	local _xdgshellprotocol='/usr/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml'
	wayland-scanner private-code "$_xdgshellprotocol" "$_sourcedirectory/wlroots/xdg-shell-protocol.c"
	wayland-scanner server-header "$_xdgshellprotocol" "$_sourcedirectory/wlroots/xdg-shell-protocol.h"

	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$_sourcedirectory/" "$_builddir/$_buildpath/"
	rm -r "$_builddir/$_buildpath/go.mod"

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

	local _binary='tinywl'
	install -Dm755 "$_bindir/$_binary" "$pkgdir/usr/bin/$_binary"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sf "/usr/share/gocode/$_buildpath/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
