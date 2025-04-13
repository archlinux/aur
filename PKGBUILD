# Maintainer: Marcel Röthke <marcel@roethke.info>

pkgname=dblab
pkgver=0.30.1
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
sha256sums=('7e17c863b3ff1e01bbedbbc421af84fada146648e162d129eaabf9e85485a47d')

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
