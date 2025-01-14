# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>

pkgname=cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Command Line Interface definition language for C++"
url="www.codesynthesis.com/projects/cli/"
arch=('i686' 'x86_64')
depends=('build2' 'libcutl')
options=('!libtool')
license=('MIT')
source=("https://pkg.cppget.org/1/stable/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('86f79382b61269915b204e30b8e13d66634eb1dd4034c42bf7015d18ab50b572')

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

	bpkg build ${pkgname}-${pkgver}.tar.gz ?sys:libcutl/*
}

package() {

	GPPVER="$(${CXX:-g++} --version | grep 'g++ (GCC)' | sed 's/g++ (GCC) //' | sed 's/\s.*$//')"
	cd "${srcdir}/odb-gcc-${GPPVER}"

	bpkg install cli

	install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
