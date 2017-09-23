pkgname=chronoengine
pkgver=3.0.0
#fragment="#tag=${pkgver}"
pkgrel=1
pkgdesc="C++ library for physics simulation"
license=('custom')
arch=('i686' 'x86_64')
url="http://projectchrono.org/chronoengine/"
depends=(glew glfw)
makedepends=(cmake git glm irrlicht glut openmpi)
#makedepends+=(intel-mkl) # -DENABLE_MODULE_MKL=ON requirement
#makedepends+=(blaze) # -DENABLE_MODULE_PARALLEL=ON requirement
optdepends=( 	 
		"irrlicht: Runtime visualization with Irrlicht."
		"glm: Runtime visualization with OpenGL."
	)
#optdepends+=(
#		"blaze: Parallel solver module for Chrono."
#		"intel-mkl: This library is currently used in Chrono for its parallel direct solver (Pardiso)"
#)

source=("${pkgname}::git+https://github.com/projectchrono/chrono.git${fragment}"
	"chronoengine.sh")
sha1sums=('SKIP'
          '8d8cb3fc9324e50cec8f5bb5dbf8a78817a32b81')

CMAKE_FLAGS=( 	-DENABLE_MODULE_POSTPROCESS=ON
		-DENABLE_MODULE_VEHICLE=ON
		-DENABLE_MODULE_FEA=ON
		-DENABLE_MODULE_PYTHON=OFF
		-DENABLE_MODULE_IRRLICHT=ON
		-DENABLE_MODULE_CASCADE=OFF
		-DENABLE_MODULE_OPENGL=ON
		-DENABLE_MODULE_PARALLEL=OFF
		-DENABLE_MODULE_MKL=OFF
		-DENABLE_MODULE_COSIMULATION=OFF
		-DENABLE_MODULE_FSI=ON
		)
#COSIMULATION not working because of missing sys/filio.h
#MKL works but building intel-mkl is such a paint that I skipped this feature

prepare() {
  cd ${pkgname}
  files=($(find -name CMakeLists.txt))
  files+=($(find -name \*.cmake\*))
  sed -i 's/lib64/lib/' ${files[@]}
  sed -i 's|share/chrono/bin|bin/chronoengine|' CMakeLists.txt
}

build() {
  mkdir -p build 
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_INSTALL_RPATH=ON \
	${CMAKE_FLAGS[@]} \
        ../${pkgname}
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 "../chronoengine/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"  
  install -D -m644 "../chronoengine.sh" "${pkgdir}/etc/profile.d/chronoengine.sh"  
}

