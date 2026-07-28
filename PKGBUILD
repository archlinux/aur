# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libodb-boost
pkgver=2.6.0
pkgrel=1
pkgdesc="The ODB boost profile library"
url="https://www.codesynthesis.com/products/odb/"
arch=('i686' 'x86_64')
depends=('build2' 'boost-libs' 'libodb')
options=('!libtool')
license=('GPL3')
source=("https://www.codesynthesis.com/download/odb/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3f7efaa8f5b042a53eef1ae40c10e3f7d780462259247376846b7671d98b3416')

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

        bpkg build ${pkgname}-${pkgver}.tar.gz ?sys:libodb/*
}

package() {

        GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
        cd "${srcdir}/odb-gcc-${GPPVER}"

        bpkg install ${pkgname}

	rm ${pkgdir}/usr/lib/pkgconfig/${pkgname}.static.pc

        mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
        mv ${pkgdir}/usr/share/doc/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
