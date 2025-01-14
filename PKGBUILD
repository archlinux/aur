# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libstudxml
pkgver=1.1.0
pkgrel=1
pkgdesc="Streaming XML pull parser and streaming XML serializer"
url="www.codesynthesis.com/projects/libstudxml/"
arch=('i686' 'x86_64')
depends=('build2')
options=('!libtool')
license=('MIT')
source=("https://pkg.cppget.org/1/stable/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bcf8d86b137c1660b0e8684403fbb14376d0b106fa2089fd8646ebd65f01c956')

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

	bpkg build ${pkgname}-${pkgver}.tar.gz
}

package() {

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
	cd "${srcdir}/odb-gcc-${GPPVER}"

	bpkg install libstudxml

	rm ${pkgdir}/usr/lib/pkgconfig/libstudxml.static.pc
	install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
