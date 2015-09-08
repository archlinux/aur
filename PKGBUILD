# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=tidb-git
pkgver=8920a55
pkgrel=1
pkgdesc="Distributed SQL database inspired by the desing of Google F1"
arch=('i686' 'x86_64')
url="https://github.com/pingcap/tidb"
license=('APACHE')
depends=('glibc')
makedepends=('go' 'godep')
source=(git+https://github.com/pingcap/tidb.git)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/tidb"
	git describe --tags --always | sed 's|-|.|g'
}

prepare() {
	mkdir -p src/github.com/pingcap
	cd src/github.com/pingcap
	rm -f tidb
	ln -s "$srcdir/tidb"
}

build() {
	export GOPATH="$srcdir"
	export PATH="$PATH:$GOPATH/bin"
	cd src/github.com/pingcap/tidb

	make parser
	go get -v
	make build
}

check() {
	export GOPATH="$srcdir"
	export PATH="$PATH:$GOPATH/bin"
	cd src/github.com/pingcap/tidb

	make test
}

package() {
	export GOPATH="$srcdir"
	export PATH="$PATH:$GOPATH/bin"
	cd src/github.com/pingcap/tidb

	make install

  cd "$GOPATH"/bin
	install -Dm755 interpreter "$pkgdir"/usr/bin/tidb
}
