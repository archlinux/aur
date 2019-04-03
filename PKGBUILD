# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=chronoengine
pkgver=4.0.0
_fragment="#tag=${pkgver}"
pkgrel=1
pkgdesc="C++ library for physics simulation"
license=('custom')
arch=('i686' 'x86_64')
url="https://projectchrono.org/"
depends=(openmpi boost-libs)
makedepends=(cmake git boost glm glew glfw irrlicht glut openmpi)
makedepends+=(python swig) # -DENABLE_MODULE_PYTHON requirement
makedepends+=(blaze) # -DENABLE_MODULE_PARALLEL=ON requirement
makedepends+=(cuda) # -DENABLE_MODULE_PARALLEL=ON optional
makedepends+=(opencascade) # -DENABLE_MODULE_CASCADE=ON required (version<=7.2)
#makedepends+=(intel-mkl) # -DENABLE_MODULE_MKL=ON requirement
optdepends=( 	 
		"irrlicht: Runtime visualization with Irrlicht."
		"glew: Runtime visualization with OpenGL."
		"glfw: Runtime visualization with OpenGL."
		"freeglut: Runtime visualization with OpenGL."
		"python: Python bindings"
		"nvidia-utils: CUDA support in PARALLEL module"
		"opencascade: add 3D CAD file support (STEP format)"
	)
#optdepends+=("intel-mkl: This library is currently used in Chrono for its parallel direct solver (Pardiso)")
#options=(!buildflags) # discard arch buildflags as -fno-plt is not supported by gcc5 (cuda host compiler)
#CPPFLAGS="-D_FORTIFY_SOURCE=2"
#CXXFLAGS="-O2 -pipe -fstack-protector-strong"
#CFLAGS=${CXXFLAGS}

source=("${pkgname}::git+https://github.com/projectchrono/chrono.git${_fragment}"
	"git+https://github.com/google/benchmark.git"
	"git+https://github.com/google/googletest.git"
	"chronoengine.sh"
	"glm.patch"
	"opencascade.patch"
	)
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          '8d8cb3fc9324e50cec8f5bb5dbf8a78817a32b81'
          '277e41186ff356fcc8c15153453d17ea61eca56a'
          '95fa0215ee6d29075dcf01c297b88f8f88864d38'
	)

CMAKE_FLAGS=( 	-DENABLE_MODULE_POSTPROCESS=ON
		-DENABLE_MODULE_VEHICLE=ON
		-DENABLE_MODULE_FEA=ON
		-DENABLE_MODULE_PYTHON=ON
		-DENABLE_MODULE_IRRLICHT=ON
		-DENABLE_MODULE_CASCADE=OFF
		-DCH_CASCADE_DIR=/opt/opencascade7
		-DENABLE_MODULE_OPENGL=ON
		-DENABLE_MODULE_PARALLEL=ON
		-DENABLE_MODULE_MKL=OFF
		-DENABLE_MODULE_COSIMULATION=ON
		-DENABLE_MODULE_FSI=ON
		-DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc
		)
#		-DCMAKE_C_COMPILER=/usr/bin/gcc-5
#		-DCMAKE_CXX_COMPILER=/usr/bin/g++-5
#		)
#		-DCUDA_PROPAGATE_HOST_FLAGS=OFF
#		)
#CUDA_PROPAGATE_HOST_FLAGS=OFF also could be used to discard arch buildflags but drops also all internaly defined ones.
#MKL works but building intel-mkl is such a paint that I skipped this feature

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule.src/chrono_thirdparty/googlebenchmark.url ${srcdir}/benchmark
  git config submodule.src/chrono_thirdparty/googletest.url ${srcdir}/googletest
  git submodule update
  files=($(find -name CMakeLists.txt))
  files+=($(find -name \*.cmake\*))
  sed -i 's/lib64/lib/' ${files[@]}
  sed -i 's|share/chrono/bin|bin/chronoengine|' CMakeLists.txt
  git apply ${srcdir}/glm.patch
#  git apply ${srcdir}/opencascade.patch
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
