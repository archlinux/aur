# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='bitw'
pkgname="$_pkgname-git"
pkgver='r47.58fe31f'
pkgrel='1'
pkgdesc='Minimalist BitWarden client with Secret Service API implementation - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mvdan/$_pkgname"
license=('BSD')
makedepends=('git' 'go-pie>=1.13' 'golang-golang-x-crypto' 'golang-github-google-uuid>=1.1.1' 'golang-github-knq-ini' 'golang-rsc-2fa>=1.1.0' 'golang-github-godbus-dbus>=5.0.3')
checkdepends=('golang-github-rogpeppe-go-internal>=1.5.0')
provides=("$_pkgname" 'org.freedesktop.secrets')
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_builddir="$pkgname-build"
_buildpath="src/mvdan.cc/$_pkgname"
_bindir="$pkgname-bin"

prepare() {
	cd "$srcdir/"

	mkdir -p "$_builddir/$(echo "$_buildpath" | rev | cut -d '/' -f 2- | rev)/"
	mv "$pkgname/" "$_builddir/$_buildpath/"
	rm -r "$_builddir/$_buildpath/go."{mod,sum}

	mkdir -p "$_bindir/"
}

pkgver() {
	cd "$srcdir/$_builddir/$_buildpath/"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
	install -Dm755 "$_bindir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_builddir/$_buildpath/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
