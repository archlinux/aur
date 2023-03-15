# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='bitw'
pkgname="$_pkgname-git"
pkgver='r91.gae87ee7'
pkgrel='1'
pkgdesc='Minimalist BitWarden client with Secret Service API implementation - git version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/mvdan/$_pkgname"
license=('BSD')
makedepends=('git' 'go>=1.19')
optdepends=(
	'wl-clipboard: clipboard utility for Wayland (one of the optdepends is required for the tests to pass - build time dep)'
	'xclip: clipboard utility for X11 (one of the optdepends is required for the tests to pass - build time dep)'
	'xsel: clipboard utility for X11 (one of the optdepends is required for the tests to pass - build time dep)'
)
provides=("$_pkgname" 'org.freedesktop.secrets')
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

_sourcedirectory="$pkgname"
_bindir="$pkgname-bin"
_gopath="$pkgname-gopath"

prepare() {
	mkdir -p "$srcdir/$_bindir/"
	mkdir -p "$srcdir/$_gopath/"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	export GOPATH="$srcdir/$_gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
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
	install -Dm755 "$_bindir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_sourcedirectory/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
