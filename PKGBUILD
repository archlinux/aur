pkgname=vtk5
pkgver=5.8
pkgrel=1
pkgdesc="Visualization Toolkit (VTK)"
arch=('i686' 'x86_64')
url='http://www.vtk.org'
depends=('cmake' 'qt4' 'python2' 'tcl' 'tk')
source=(http://www.vtk.org/files/release/$pkgver/vtk-$pkgver.0.tar.gz)
md5sums=('37b7297d02d647cc6ca95b38174cb41f')

build() {
	cd "$srcdir/VTK"
	sed -i '/^.*VERSION_GREATER 4\.2\.0 AND BUILD_SHARED_LIBS/{:b;$!N;/endif\(\)/!bb;s/.*/  set(VTK_ABI_CXX_FLAGS "-fvisibility=hidden -fvisibility-inlines-hidden")/}' CMake/vtkCompilerExtras.cmake
	sed -i 's/self->RW = ckalloc/self->RW = (char *) ckalloc/g' Rendering/vtkTkRenderWidget.cxx
	mkdir -p build
	cd build
	alias python="/usr/bin/python2"
	cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON -DVTK_WRAP_PYTHON=ON -DVTK_USE_QT=ON -DCMAKE_CXX_FLAGS="-DGLX_GLXEXT_LEGACY -std=c++98 -w" ..
	ncores=$(grep -c '^processor' /proc/cpuinfo)
	make -j$ncores
}

package() {
	cd "$srcdir/VTK/build"
	make DESTDIR="$pkgdir" install
}

