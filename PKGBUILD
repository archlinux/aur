# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=odb
pkgver=2.5.0
pkgrel=1
pkgdesc="C++ Object-Relational Mapping compiler"
url="https://www.codesynthesis.com/products/odb/"
arch=('i686' 'x86_64')
depends=('build2' 'libcutl' 'libstudxml' 'cli')
options=('!libtool')
license=('GPL3')
source=("https://www.codesynthesis.com/download/odb/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9151172907f8d0116a6429b259dcc900ced0a2992a5eb6144b8e4ca0525fc648')

prepare() {

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"

	bpkg create -d odb-gcc-${GPPVER} cc \
	config.cxx=${CXX:-g++} \
	config.cc.coptions="-O3 -DODB_GCC_PLUGIN_DIR $CXXFLAGS" \
	config.bin.rpath=${pkgdir}/usr/lib \
	config.install.root=${pkgdir}/usr \
	config.install.relocatable=true

	mv ${pkgname}-${pkgver}.tar.gz odb-gcc-${GPPVER}
}

build() {

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
	cd "${srcdir}/odb-gcc-${GPPVER}"

	bpkg build ${pkgname}-${pkgver}.tar.gz ?sys:libcutl/* ?sys:libstudxml/* ?sys:cli/*
}

package() {

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
	cd "${srcdir}/odb-gcc-${GPPVER}"

	bpkg install odb

	mkdir -p ${pkgdir}/usr/lib/gcc/x86_64-pc-linux-gnu/${GPPVER}/plugin/
	mv ${pkgdir}/usr/bin/odb.so ${pkgdir}/usr/lib/gcc/x86_64-pc-linux-gnu/${GPPVER}/plugin/

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	mv ${pkgdir}/usr/share/doc/odb/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
