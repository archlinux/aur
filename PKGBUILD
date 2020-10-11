# Maintainer: Mirko Scholz <mirko dot scholz nine at gmail dot com>
pkgname=folie
pkgver=2.15
pkgrel=3
pkgdesc="Forth Live Explorer is a command-line utility to talk to a micro-controller via a serial port."
arch=('i686' 'x86_64')
url="https://github.com/jeelabs/folie"
license=('custom:UNLICENSE')
depends=('glibc')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_folie_ver=d9b51c7fd7b750ceab710554dfbece3a080065ed
source=(
folie::git+https://git.jeelabs.org/jcw/folie#commit=$_folie_ver
)
noextract=("${source[@]%%::*}")
sha1sums=('SKIP')

prepare() {
	export GOPATH="$srcdir/.."

	cd "folie"
	go get -v
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-v -buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	export GOPATH="$srcdir/.."

	cd "folie"
	go build
}

package() {
  install -Dm755 "$srcdir/../bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/folie/UNLICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
