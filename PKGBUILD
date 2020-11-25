# Maintainer: Patrick Lühne <patrick-arch@luehne.de>
pkgname=vampire
pkgver=4.5.1
_commit_description='57a6f78c on 2020-07-15 11:59:04 +0200'
pkgrel=1
pkgdesc='A theorem prover for first-order logic'
arch=('x86_64')
url='https://vprover.github.io/'
license=('custom:Vampire Software Licence Agreement')
depends=('z3')
source=("https://github.com/vprover/${pkgname}/archive/${pkgver}.tar.gz"
	'reproducible-builds.patch')
sha512sums=('dada4d91d96cdfe7a0f345f64d3c0e5ce2c909965cb8a90fd25d12ff4a8ee61e02b473d2e0054d90ae2930f5606728ff6b51ceb780c7ae1f5b35925f3b10fae4'
            '894f739b84a006bce1e59109776b00ced190fc2cc30abedde2d5a50e6654efe63607d04c9815c780fddfc02a2cf0821afd558307f7e89f7bae9dbbfb52411b94')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/reproducible-builds.patch"
}

build() {
	cd "${pkgname}-${pkgver}"
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DZ3_DIR=/usr/lib/cmake/z3/ -DVAMPIRE_AUR_GIT_COMMIT_DESCRIPTION="${_commit_description}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -D "build/bin/${pkgname}" -t "${pkgdir}/usr/bin/"
	install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -D -m644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
