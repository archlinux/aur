#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Notes:
# MUMPS need some work to be able to link corectly with deps of mumps (scotch,mpi)

_pkgname=chronoengine
pkgname=${_pkgname}-git
pkgver=5.0.1.r397.g21725cc0b
#_fragment="#tag=${pkgver}"
pkgrel=1
pkgdesc="An Open Source Multi-physics Simulation Engine"
license=('custom')
arch=('i686' 'x86_64')
url="https://projectchrono.org/"
depends=(openmpi blas boost-libs hdf5)
makedepends+=(cmake eigen git boost glm glew glfw irrlicht glut openmpi gcc-fortran)
makedepends+=(python swig) # MODULE_PYTHON
makedepends+=(cuda)        # MODULE_GRANULAR
                           # MODULE_PARALLEL optional
makedepends+=(blaze)       # MODULE_PARALLEL required
makedepends+=(thrust)      # MODULE_PARALLEL required
#makedepends+=(opencascade)# MODULE_CASCADE (version<=7.2)
                           # use oce (opencascade comunitiy edition)
makedepends+=(oce)         # MODULE_CASCADE
makedepends+=(mumps)       # MODULE_MUMPS
makedepends+=(blas)        # MODULE_MUMPS required
makedepends+=(intel-mkl)   # MODULE_MKL
optdepends+=(	"irrlicht: Runtime visualization with Irrlicht."
		"glew: Runtime visualization with OpenGL."
		"glfw: Runtime visualization with OpenGL."
		"freeglut: Runtime visualization with OpenGL."
		"python: Python bindings"
		"nvidia-utils: CUDA support in PARALLEL module"
		"opencascade: add 3D CAD file support (STEP format)"
		"intel-mkl: This library is currently used in Chrono for its parallel direct solver (Pardiso)"
		)
source=("${pkgname}::git+https://github.com/projectchrono/chrono.git${_fragment}"
	"git+https://github.com/google/benchmark.git"
	"git+https://github.com/google/googletest.git"
	"chronoengine.sh"
	"glm.patch"
	"fsi.patch"
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '0fe883cfcc1db869d08235482a3801fa458db15360e0eefac9084c7f2993af4a'
            '4e8ed0097fb14bbe437c2a57e9ef1852fdbfe8675e5345b0af42287d24fbfefe'
            '30b72d0004f784950ef8496a10cc491de8d98a855c6db97ac8fe2e73d01c1579')

CMAKE_FLAGS=(	-DENABLE_MODULE_POSTPROCESS=ON
		-DENABLE_HDF5=ON
		-DENABLE_MODULE_VEHICLE=ON
		-DENABLE_MODULE_PYTHON=ON
		-DENABLE_MODULE_IRRLICHT=ON
		-DENABLE_MODULE_CASCADE=ON
		-DCASCADE_ROOT=/opt/oce
		-DCASCADE_INCLUDE_DIR=/opt/oce/include/oce
		-DENABLE_MODULE_OPENGL=ON
		-DENABLE_MODULE_PARALLEL=ON
		-DTHRUST_INCLUDE_DIR=/opt/thrust
		-DENABLE_MODULE_MKL=ON
		-DINTEL_ROOT=/opt/intel/mkl
		-DENABLE_MODULE_COSIMULATION=ON
		-DENABLE_MODULE_FSI=ON
		-DENABLE_MODULE_MUMPS=OFF
		-DENABLE_MODULE_DISTRIBUTED=ON
		-DENABLE_MODULE_GRANULAR=ON
		-DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc
		)

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule.src/chrono_thirdparty/googlebenchmark.url "${srcdir}"/benchmark
  git config submodule.src/chrono_thirdparty/googletest.url "${srcdir}"/googletest
  git submodule update
  mapfile -t files < <(find . -name CMakeLists.txt)
  mapfile -t -O ${#files[@]} files < <(find . -name \*.cmake\*)
  sed -i 's/lib64/lib/' "${files[@]}"
  sed -i 's|share/chrono/bin|bin/chronoengine|' CMakeLists.txt
  git apply -v "${srcdir}"/glm.patch
  git apply -v "${srcdir}"/fsi.patch
}

pkgver() {
  cd ${pkgname}
  git describe --long --tag| sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_SKIP_INSTALL_RPATH=ON \
	"${CMAKE_FLAGS[@]}" \
	-S ${pkgname} \
	-B build
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -D -m644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "chronoengine.sh" "${pkgdir}/etc/profile.d/chronoengine.sh"
}
