pkgname=vxl
pkgver=1.17
pkgrel=1
pkgdesc="VXL library. The geometry and imaging core libraries are turned off in order to build successfully. "
arch=('i686' 'x86_64')
url='http://vxl.sourceforge.net/'
depends=('cmake')
source=(http://excellmedia.dl.sourceforge.net/project/vxl/vxl/$pkgver/vxl-$pkgver.0.tar.gz)
md5sums=('cf71031dee80f92e6649c4faa2d485b5')

build() {
	cd "$srcdir/vxl-$pkgver.0"
	sed -i 's/error "Dunno about this gcc"/define VCL_GCC_41/g' vcl/vcl_compiler.h
	mkdir -p build
	cd build
	cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DCMAKE_CXX_FLAGS="-std=c++98 -DGNU_LIBSTDCXX_V3 -w" -DBUILD_CORE_GEOMETRY=OFF -DBUILD_CORE_IMAGING=OFF ..
	ncores=$(grep -c '^processor' /proc/cpuinfo)
	make -j$ncores
}

package() {
	cd "$srcdir/vxl-$pkgver.0/build"
	make DESTDIR="$pkgdir" install
}

