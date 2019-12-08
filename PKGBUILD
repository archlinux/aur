# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='certspotter'
pkgver='0.9'
pkgrel='4'
pkgdesc='Certificate Transparency Log Monitor'
arch=('x86_64')
url="https://github.com/SSLMate/$pkgname"
license=('MPL2')
makedepends=('git' 'go-pie')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ea377ae70a0a754c6ec07ec63d23a0fd4b41be714d9e67a8603a858edc7309fa')

_gopath="$pkgname-$pkgver-$pkgrel-gopath"

prepare() {
	mkdir -p "$srcdir/$_gopath/src/software.sslmate.com/src/"
	mv "$srcdir/$pkgname-$pkgver/" "$srcdir/$_gopath/src/software.sslmate.com/src/$pkgname/"

	export GOPATH="$srcdir/$_gopath"
	go get -d -v "software.sslmate.com/src/$pkgname/cmd/$pkgname"
}

build() {
	export GOPATH="$srcdir/$_gopath"
	go install -gcflags "all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-extldflags $LDFLAGS" "software.sslmate.com/src/$pkgname/cmd/$pkgname"
}

package() {
	install -Dm755 "$srcdir/$_gopath/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
