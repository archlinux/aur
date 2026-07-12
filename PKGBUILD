# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: gcmalloc <gcmalloc@gmail.com>

pkgname=openrdap-client
pkgver=0.10.0
pkgrel=1
pkgdesc="OpenRDAP is an command line RDAP client implementation in Go."
url="https://www.openrdap.org/"
arch=("x86_64")
license=("MIT")
depends=("glibc")
makedepends=("go")
provides=("rdap")
conflicts=("rdap")
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/openrdap/rdap/archive/v$pkgver.tar.gz")
sha256sums=('19a6b1fe6c3335fa8bb48fb4c33ce56082e0ffdd24dd649745793613ab6c85cb')

prepare() {
	cd rdap-${pkgver}/cmd/rdap
	GOPATH="${srcdir}" go mod download -modcacherw
}

build() {
	cd rdap-${pkgver}/cmd/rdap
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	GOPATH="${srcdir}" go build
}

package() {
	cd rdap-${pkgver}
	install -Dm755 cmd/rdap/rdap "$pkgdir/usr/bin/rdap"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
