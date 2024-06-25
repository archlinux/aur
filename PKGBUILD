# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libodb-boost
pkgver=2.5.0b27
_pkgver=2.5.0-b.27
pkgrel=1
pkgdesc="The ODB boost profile library"
url="https://www.codesynthesis.com/products/odb/"
arch=('i686' 'x86_64')
depends=('build2' 'boost-libs' 'libodb')
options=('!libtool')
license=('GPL3')

build() {
	cd "${srcdir}"
	mkdir -p "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/${pkgname}-${pkgver}"

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"

	bpkg create -d gcc-${GPPVER} cc \
	config.cxx=${CXX:-g++} \
	config.cc.coptions="-O3 $CXXFLAGS" \
	config.bin.lib=shared \
	config.install.root=${pkgdir}/usr \
	config.install.relocatable=true

	cd gcc-${GPPVER}
	bpkg build --trust-yes ${pkgname}/${_pkgver}@https://pkg.cppget.org/1/beta ?sys:libodb
}

package() {

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
	cd "${srcdir}/${pkgname}-${pkgver}/gcc-${GPPVER}"

	bpkg install ${pkgname}

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	mv ${pkgdir}/usr/share/doc/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
