# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=libstud-optional
pkgver=1.0.0
pkgrel=1
pkgdesc="A reasonably-conforming optional class template implementation for C++14"
url="https://www.codesynthesis.com/projects/libstud-optional/"
arch=('i686' 'x86_64')
depends=('build2')
options=('!libtool')
license=('MIT')
source=("https://pkg.cppget.org/1/stable/libstud/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5ae2487e81b95335c25b89b61390353a84a31c93f51a88151d8ca635bcfddbe4')

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

	bpkg install ${pkgname}

	rm ${pkgdir}/usr/lib/pkgconfig/${pkgname}.static.pc
	install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
