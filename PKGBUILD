# Maintainer: Iru Cai <https://vimacs.wehack.space>
# Contributor: Iru Cai <https://vimacs.wehack.space>

pkgname=golang-golang-x-tour-git
pkgver=404.a278aee
pkgrel=1
pkgdesc='A tour of Go - an introduction to the Go programming language'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://tour.golang.org/'
license=('BSD')
source=("git+https://github.com/golang/tour.git")
sha256sums=('SKIP')
makedepends=(golang-golang-x-tools)

pkgver() {
	cd "$srcdir/tour"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	GOSRC="$srcdir/build/src/golang.org/x"
	mkdir -p "$GOSRC"
	mv "$srcdir/tour" "$GOSRC"
	cd "$GOSRC/tour"
	rm -f go.mod go.sum
	GO111MODULE=off GOPATH="$srcdir/build:/usr/share/gocode" go build -v
}

package() {
	GOSRC="$srcdir/build/src/golang.org/x"
	install -D -m755 "$GOSRC/tour/tour" "$pkgdir/usr/bin/_golang-tour"
	cat > "$pkgdir/usr/bin/golang-tour" << EOF
#!/bin/sh
GO111MODULE=off GOPATH=/usr/share/gocode _golang-tour
EOF
	chmod +x "$pkgdir/usr/bin/golang-tour"
	cd "$GOSRC/tour"
	rm -rf tour .git .gcloudignore
	install -d "$pkgdir/usr/share/gocode/src/golang.org/x"
	cp -a "$GOSRC/tour" "$pkgdir/usr/share/gocode/src/golang.org/x"
}
