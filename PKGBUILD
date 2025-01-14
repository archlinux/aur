# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libodb-qt
pkgver=2.5.0
pkgrel=1
pkgdesc="The ODB Qt profile library"
url="https://www.codesynthesis.com/products/odb/"
arch=('i686' 'x86_64')
depends=('build2' 'libodb')
options=('!libtool')
license=('GPL3')
source=("https://www.codesynthesis.com/download/odb/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9456c6afdd966b189ece0e0e3486317fe2506a2590da24fbdf81e71b8d5ed130')

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
