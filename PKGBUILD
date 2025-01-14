# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libodb-mssql
pkgver=2.5.0
pkgrel=1
pkgdesc="The ODB mssql runtime library"
url="https://www.codesynthesis.com/products/odb/"
arch=('i686' 'x86_64')
depends=('build2' 'unixodbc' 'libodb')
options=('!libtool')
license=('GPL3')
source=("https://www.codesynthesis.com/download/odb/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('eefa34f8b174629b06fced38c9b5b5da7545c03bcb56e328e98bd79b325bb43f')

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

        bpkg build ${pkgname}-${pkgver}.tar.gz ?sys:libodb/* ?sys:cli/*
}

package() {

        GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
        cd "${srcdir}/odb-gcc-${GPPVER}"

        bpkg install ${pkgname}

		rm ${pkgdir}/usr/lib/pkgconfig/${pkgname}.static.pc

        mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
        mv ${pkgdir}/usr/share/doc/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
