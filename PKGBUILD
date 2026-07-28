# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=odb
pkgver=2.6.0
pkgrel=1
pkgdesc="C++ Object-Relational Mapping compiler"
url="https://www.codesynthesis.com/products/odb/"
arch=('x86_64')
depends=('build2' 'libcutl' 'libstudxml' 'cli')
options=('!libtool')
license=('GPL3')
source=("https://www.codesynthesis.com/download/odb/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('93a61928b6302360ad4c268bd1d432276b062992cf79aa70554da22b279d61b9')

prepare() {
	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"

	bpkg create -d odb-gcc-${GPPVER} cc \
	config.cxx=${CXX:-g++} \
	config.cc.coptions="-O3 -DODB_GCC_PLUGIN_DIR $CXXFLAGS" \
	config.bin.rpath=${pkgdir}/usr/lib \
	config.install.root=${pkgdir}/usr \
	config.install.relocatable=true

	mv ${pkgname}-${pkgver} odb-gcc-${GPPVER}/${pkgname}
}

build() {
	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
	cd "${srcdir}/odb-gcc-${GPPVER}"

	bpkg build ${pkgname}/ ?sys:libcutl/* ?sys:libstudxml/* ?sys:cli/* ?sys:libstud-optional/*
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
