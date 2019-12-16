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
md5sums=('f84ecff61c52602c2cf964fd6ed83163')

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
