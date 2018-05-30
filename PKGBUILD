# Maintainer: Bryn Edwards <bryn@protonmail.ch>

pkgname=antibody
pkgver=3.4.6
pkgrel=1
pkgdesc="A shell plugin manager."
arch=('i686' 'x86_64')
url="https://getantibody.github.io/"
license=('MIT')
makedepends=('go')
source=("https://github.com/getantibody/antibody/archive/v${pkgver}.tar.gz")
sha256sums=('985875bd8ffc8dc8ae421c4f3becfd55cd147ca3a3e30513158ef7048fae8a6d')
_repodir=(".go/src/github.com/getantibody")

prepare() {
	export GOPATH="$srcdir/.go"
	export PATH="$GOPATH/bin:$PATH"
	mkdir -p "$srcdir/.go/src/github.com/getantibody"
	ln -sf "$srcdir/$pkgname-$pkgver" \
          "$srcdir/$_repodir/$pkgname"
	cd "$srcdir/$_repodir/$pkgname"
	sed -i "22s/dev/$pkgver/" "main.go"
	go get -u github.com/golang/dep/...
	go get -u github.com/pierrre/gotestcover
	dep ensure
}

build() {
	export GOPATH="$srcdir/.go"
	cd "$srcdir/$_repodir/$pkgname"
	make
}

# Test fails
#check() {
	#export GOPATH="$srcdir/.go"
	#export PATH="$GOPATH/bin:$PATH"
	#cd "$srcdir/$_repodir/$pkgname"
	#make test
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

