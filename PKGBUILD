# Maintainer: Frederic Van Assche <frederic@fredericva.com>
pkgname=cry
pkgver=1.7
pkgrel=1
pkgdesc="Cosmic ray generator code"
arch=('i686' 'x86_64')
url="http://nuclear.llnl.gov/simulation/main.html"
license=('custom')
depends=()
source=("http://nuclear.llnl.gov/simulation/${pkgname}_v${pkgver}.tar.gz"
	"shared-library.patch"
	"cry-physics.csh"
	"cry-physics.sh")
md5sums=('85f240bebe81fe0b257e92ef1d390a83'
         '31ddfc3d2ecb5e142bf592d3811fe985'
         '20185fc3a649a5a7c47b422e44decf1d'
         'e85c67d9607e76ee893c5e522b01d57c')

prepare() {
	cd "${pkgname}_v${pkgver}"

	cd src
	patch --binary -i "${srcdir}/shared-library.patch"
}

build() {
	cd "${pkgname}_v${pkgver}"
	make lib
}

package() {
	cd "${pkgname}_v${pkgver}"

	install -dv "${pkgdir}/usr/share/cry-physics/data"
	install -m 644 data/*.data "${pkgdir}/usr/share/cry-physics/data"

	install -dv "${pkgdir}/usr/include/cry"
	install -m 644 src/*.h "${pkgdir}/usr/include/cry"

	install -dv "${pkgdir}/usr/lib"
	install -m 644 lib/libCRY.so "${pkgdir}/usr/lib"

	install -dv "${pkgdir}/etc/profile.d"
	install -m755 "${srcdir}/cry-physics.csh" "${pkgdir}/etc/profile.d"
	install -m755 "${srcdir}/cry-physics.sh" "${pkgdir}/etc/profile.d"
}
