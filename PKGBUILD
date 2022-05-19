# Maintainer: howeyc <chris@howey.me>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ivy-calc
_srcname=ivy
_binname=ivyc
pkgver=0.2.8
pkgrel=1
pkgdesc='An APL-like calculator.'
arch=('i686' 'x86_64')
url='https://github.com/robpike/ivy'
license=('BSD')
makedepends=('go')
provides=("${_binname}")
conflicts=("${_binname}")
source=("${_srcname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('36344aa566bcf59ee0733cb79f55261d1cb7c84c5534815a2e9177fcf06fa3d3')

build() {
	cd "$srcdir/${_srcname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "${_binname}" .
}

package() {
	cd "$srcdir/${_srcname}-${pkgver}"
	install -D -m755 ${_binname} "$pkgdir/usr/bin/${_binname}"
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	sed '11,375!d' doc.go > README
	install -Dm644 README $pkgdir/usr/share/doc/${pkgname}/README
}
