# Maintainer: bipin kumar <kbipinkumar@pm.me>
# Contributor: flying-sheep <flying-sheep@web.de>
pkgname=kallisto
pkgver=0.52.0
pkgrel=1
pkgdesc='Quantify abundances of transcripts from RNA-Seq data. doi:10.1038/nbt.3519'
url="http://pachterlab.github.io/$pkgname/"
license=('BSD-2-Clause')
arch=('x86_64')
depends=('hdf5' 'zlib' 'glibc' 'gcc-libs' 'libgcc' 'libstdc++')
makedepends=('cmake' 'git')
optdepends=('bustools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz"
		"compiler.patch")
sha256sums=('68184e41706d77e409f05a598a87dacdf3cf227f18c028175e2bce8b284bdea4'
            '857256ec9ca8bdf8106128804238e4f26ab681bc5248638f067303097cd2e9d1')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	# https://github.com/pachterlab/kallisto/issues/303#issuecomment-884612169
	pushd ext/htslib
	sed -i '/AC_PROG_CC/a \
AC_CANONICAL_HOST \
AC_PROG_INSTALL \
' configure.ac
	autoreconf -i
	autoheader
	autoconf
	popd

	# add missing header
	sed -i '/#include <algorithm>/a #include <limits>' src/MinCollector.cpp
	#cmake fixes
	sed -i 's/cmake_minimum_required(VERSION 3.0.0)/cmake_minimum_required(VERSION 3.10)/g' CMakeLists.txt
	
	# fix HDF5 find and link
	sed -i 's/#find_package( HDF5 COMPONENTS CXX REQUIRED )/find_package( HDF5 REQUIRED )/' src/CMakeLists.txt
	sed -i 's/#if(HDF5_FOUND)/if(HDF5_FOUND)/' src/CMakeLists.txt
	sed -i 's/#else()/else()/' src/CMakeLists.txt
	sed -i 's/#endif()/endif()/' src/CMakeLists.txt

	cd ext/bifrost
	sed -i 's/cmake_minimum_required(VERSION 3.0.0)/cmake_minimum_required(VERSION 3.10)/g' CMakeLists.txt
	#compiler fix
	patch -p1 < ${srcdir}/compiler.patch
}
build() {
	cd "$srcdir/$pkgname-$pkgver"
	pushd ext/htslib
	./configure --disable-bz2 --disable-lzma --disable-libcurl
	make lib-static
	popd
	rm -rf build
	cmake -B build \
	-DCMAKE_BUILD_TYPE='Release' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
		-DUSE_HDF5=ON \
		-DUSE_BAM=ON \
	-Wno-dev
    MAKEFLAGS=-j1 cmake --build build
}
package() {
	cd "$srcdir/$pkgname-$pkgver/"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$srcdir/$pkgname-$pkgver/license.txt" -t "$pkgdir/usr/share/licenses/$pkgname"

}
