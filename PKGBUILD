# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
# Contributor: Jonathan Knapp <jaknapp8+aur@gmail.com>

pkgname=termshark
pkgver=2.2.0
pkgrel=1
pkgdesc="A terminal UI for tshark, inspired by Wireshark"
arch=('any')
url='https://termshark.io'
license=('MIT')
depends=('wireshark-cli')
makedepends=('git' 'go')
provides=('termshark')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gcla/termshark/archive/v${pkgver}.tar.gz")
sha256sums=('deefdb0b65e5d5b97c305cf280770724542f8dd122502f616e394c62c91db0c4')

prepare(){
	cd "$pkgname-$pkgver"
	mkdir -p build
    mkdir -p build-gopath
}

build() {
    cd "$pkgname-$pkgver"

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOPATH="$srcdir/build-gopath"

	go build \
    	-trimpath \
	    -buildmode=pie \
	    -mod=readonly \
    	-modcacherw \
	    -ldflags "-extldflags ${LDFLAGS}" \
        -o build \
    	./cmd/...
}

check() {
	cd "$pkgname-$pkgver"

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOPATH="$srcdir/build-gopath"

	go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

