# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libodb-oracle
pkgver=2.5.0
pkgrel=1
pkgdesc="The ODB Oracle runtime library"
url="https://www.codesynthesis.com/products/odb/"
arch=('i686' 'x86_64')
depends=('build2' 'libodb' 'oracle-instantclient-sdk' 'oracle-instantclient-sqlplus' 'unixodbc')
options=('!libtool')
license=('custom')
source=("https://www.codesynthesis.com/download/odb/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e1e95a85adc9b336f645ed21685e35a47da1a8ce4de96fa689a656851df6be39')

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
