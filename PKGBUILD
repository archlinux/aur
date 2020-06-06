# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='certspotter'
pkgname="$_pkgname-git"
pkgver='0.10.r1.g6d5e239'
pkgrel='2'
pkgdesc='Certificate Transparency Log Monitor - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/SSLMate/$_pkgname"
license=('MPL2')
makedepends=('git' 'go>=1.5')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_sourcedirectory="$pkgname"
_bindir="$pkgname-bin"
_gopath="$pkgname-gopath"

prepare() {
	mkdir -p "$srcdir/$_bindir/"
	mkdir -p "$srcdir/$_gopath/"
}

pkgver() {
	cd "$srcdir/$_builddir/$_buildpath/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	go mod init "software.sslmate.com/src/$_pkgname"
	go mod tidy
	export GOFLAGS="$GOFLAGS -mod=readonly"
	go build -v -o "$srcdir/$_bindir/" './...'
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go test -v './...'
}

package() {
	cd "$srcdir/"
	for _binary in "$_pkgname" 'ctparsewatch' 'submitct'; do
		install -Dm755 "$_bindir/$_binary" "$pkgdir/usr/bin/$_binary"
	done
}
