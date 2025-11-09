# Maintainer: flying-sheep <flying-sheep@web.de>
# Contributor: bipin kumar <kbipinkumar@pm.me>
pkgname=kallisto
pkgver=0.51.1
pkgrel=3
pkgdesc='Quantify abundances of transcripts from RNA-Seq data. doi:10.1038/nbt.3519'
url="http://pachterlab.github.io/$pkgname/"
license=('BSD-2-Clause')
arch=('x86_64')
depends=('hdf5' 'zlib' 'glibc' 'gcc-libs')
makedepends=('cmake' 'git')
optdepends=('bustools')
source=($pkgname-$pkgver.tar.gz::"https://github.com/pachterlab/$pkgname/archive/v$pkgver.tar.gz"
		"compiler.patch::https://patch-diff.githubusercontent.com/raw/pmelsted/bifrost/pull/18.diff")
sha256sums=('a8bcc23bca6ac758f15e30bb77e9e169e628beff2da3be2e34a53e1d42253516'
            '7fcdd07cea4c94b9c27a3a02ab8de6bb55007d1e0bd7c3f1244bc3bd623f15bf')

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
	cd ext/bifrost
	sed -i 's/cmake_minimum_required(VERSION 3.0.0)/cmake_minimum_required(VERSION 3.10)/g' CMakeLists.txt
	#compiler fix
	patch -p1 < ${srcdir}/compiler.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
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
