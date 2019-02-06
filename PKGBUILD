# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=virusgotal-git
pkgver=1.0.2.r2.g5893d27
pkgrel=1
pkgdesc='VirusTotal zero dependency command line client.'
arch=(x86_64)
url='https://github.com/moldabekov/virusgotal'
license=(MIT)
makedepends=(go)
conflicts=(virusgotal)
provides=(virusgotal)
source=("${pkgname}::git+https://github.com/moldabekov/virusgotal")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"

	install -m755 -d "$srcdir/go/src/github.com/moldabekov"
	cp -a "$srcdir/$pkgname" "$srcdir/go/src/github.com/moldabekov/virusgotal"
}

build() {
	cd "$srcdir/go/src/github.com/moldabekov/virusgotal"

	export GOPATH="$srcdir/go"
	export PATH="$GOPATH/bin:$PATH"

	go get -v github.com/moldabekov/virusgotal

	mkdir -p bin
	go build -ldflags "-s -w" -o bin/virusgotal github.com/moldabekov/virusgotal

}

package() {
	cd "$srcdir/go/src/github.com/moldabekov/virusgotal"

	install -Dm755 bin/virusgotal $pkgdir/usr/bin/virusgotal
}
