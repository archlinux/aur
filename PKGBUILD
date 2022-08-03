# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libodb-mysql
pkgver=2.5.0b23
pkgrel=1
pkgdesc="The ODB MySQL runtime library"
arch=('i686' 'x86_64')
url="https://www.codesynthesis.com/products/odb/"
depends=('build2' 'mariadb-libs')
options=('!libtool')
license=('GPL3')

build() {
	cd "${srcdir}"
	mkdir -p "${srcdir}/${pkgname}-${pkgver}"
	cd "${srcdir}/${pkgname}-${pkgver}"

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"

	bpkg create -d gcc-${GPPVER} cc \
	config.cxx=${CXX:-g++} \
	config.cc.coptions="-O3 -DLIBODB_MYSQL_MARIADB $CXXFLAGS" \
	config.bin.lib=shared \
	config.install.root=${pkgdir}/usr

	cd gcc-${GPPVER}
	bpkg add https://pkg.cppget.org/1/beta
	bpkg fetch --trust-yes
	bpkg build --trust-yes ${pkgname} ?sys:libmysqlclient ?sys:libodb
}

package() {

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
	cd "${srcdir}/${pkgname}-${pkgver}/gcc-${GPPVER}"

	bpkg install ${pkgname}

	for f in ${pkgdir}/usr/lib/pkgconfig/*.pc; do sed -i "s|${pkgdir}||" ${f}; done

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	mv ${pkgdir}/usr/share/doc/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
