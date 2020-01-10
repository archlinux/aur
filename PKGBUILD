# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='certspotter'
pkgname="$_pkgname-git"
pkgver='0.9.r17.ge74cb79'
pkgrel='1'
pkgdesc='Certificate Transparency Log Monitor - git version'
arch=('x86_64')
url="https://github.com/SSLMate/$_pkgname"
license=('MPL2')
makedepends=('git' 'go-pie')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

_gopath="$pkgname-gopath"

pkgver() {
	cd "$srcdir/$_gopath/src/software.sslmate.com/src/$_pkgname/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "$srcdir/$_gopath/src/software.sslmate.com/src/"
	mv "$srcdir/$pkgname/" "$srcdir/$_gopath/src/software.sslmate.com/src/$_pkgname/"

	export GOPATH="$srcdir/$_gopath"
	go get -d -v "software.sslmate.com/src/$_pkgname/cmd/$_pkgname"
}

build() {
	export GOPATH="$srcdir/$_gopath"
	go install -gcflags "all=-trimpath=$PWD" -asmflags "all=-trimpath=$PWD" -ldflags "-extldflags $LDFLAGS" "software.sslmate.com/src/$_pkgname/cmd/$_pkgname"
}

package() {
	install -Dm755 "$srcdir/$_gopath/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
