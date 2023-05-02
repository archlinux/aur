# maintainer: BrainDamage

pkgname=tweego
pkgver=2.1.1
pkgrel=1
pkgdesc="a command line compiler for Twine/Twee story formats, written in Go"
arch=('x86_64')
url='https://www.motoslave.net/tweego'
license=('BSD')
makedepends=('go')
source=("${pkgname}-${pkgver}::https://github.com/tmedwards/tweego/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f58991ff0b5b344ebebb5677b7c21209823fa6d179397af4a831e5ef05f28b02')

build() {
	cd "${pkgname}-${pkgver}"
	go mod tidy
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags '${LDFLAGS}'" \
		-o "${pkgname}" .
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dvm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dvm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	cd docs
	find . -mindepth 1 -exec install -Dvm 644 {} "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}
