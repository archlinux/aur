# Maintainer: Bryn Edwards <bryn@protonmail.ch>

pkgname=antibody
pkgver=3.3.1
pkgrel=3
pkgdesc="A shell plugin manager."
arch=('i686' 'x86_64')
url="https://getantibody.github.io/"
license=('MIT')
makedepends=('go')
source=("https://github.com/getantibody/antibody/archive/v${pkgver}.tar.gz")
sha256sums=('e9fbca761c93cf2c590f2c2fc68db4559a6825bd3a093a875a767d56f87ce7c7')
_repodir=(".go/src/github.com/getantibody")

prepare() {
	export GOPATH="$srcdir/.go"
	export PATH="$GOPATH/bin:$PATH"
	mkdir -p "$srcdir/.go/src/github.com/getantibody"
	ln -sf "$srcdir/$pkgname-$pkgver" \
          "$srcdir/$_repodir/$pkgname"
	cd "$srcdir/$_repodir/$pkgname"
	sed -i "21s/dev/$pkgver/" "main.go"
	go get -u github.com/golang/dep/...
	go get -u github.com/pierrre/gotestcover
	dep ensure
}

build() {
	export GOPATH="$srcdir/.go"
	cd "$srcdir/$_repodir/$pkgname"
	make
}

check() {
	export GOPATH="$srcdir/.go"
	export PATH="$GOPATH/bin:$PATH"
	cd "$srcdir/$_repodir/$pkgname"
	make test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

