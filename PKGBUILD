# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: gcmalloc <gcmalloc@gmail.com>

pkgname=openrdap-client
pkgver=0.10.1
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
sha256sums=('e2a41901fb1497412e0391338af5b7673fac24127fe5080c0e60c8bb5cae961e')

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
	GOPATH="${srcdir}" go build -ldflags "-X github.com/openrdap/rdap.releaseVersion=${pkgver}"
}

package() {
	cd rdap-${pkgver}
	install -Dm755 cmd/rdap/rdap "$pkgdir/usr/bin/rdap"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 rdap.1 "${pkgdir}/usr/share/man/man1/rdap.1"
}
