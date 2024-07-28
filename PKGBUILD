# Maintainer: Marcel Röthke <marcel@roethke.info>

pkgname=dblab
pkgver=0.25.0
pkgrel=1
pkgdesc="Interactive client for PostgreSQL, MySQL, SQLite3, Oracle and SQL Server"
arch=(x86_64 i686 aarch64 armv7h armv7h)
url="https://github.com/danvergara/dblab"
license=('MIT')
depends=(glibc)
makedepends=(go)
checkdepends=()
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/danvergara/dblab/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1c1e18b1752e8b32d5a42bada8dae7759f0b682eeffe7b1a6c2ce15960ce243d')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOPATH="${srcdir}"
	export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
	go build -o dblab -ldflags "-compressdwarf=false -linkmode=external" .
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 dblab "${pkgdir}/usr/bin/dblab"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/zsh/site-functions"
	./dblab completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_dblab"
}
