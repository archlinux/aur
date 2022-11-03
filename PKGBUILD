#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# Notes:
# MUMPS need some work to be able to link corectly with deps of mumps (scotch,mpi)

#Configuration:
#Use: makepkg VAR1=0 VAR2=1 to enable(1) disable(0) a feature
#Use: {yay,paru} --mflags=VAR1=0,VAR2=1
#Use: aurutils --margs=VAR1=0,VAR2=1
#Use: VAR1=0 VAR2=1 pamac

((ENABLE_OPENCRG)) && _opencrg=ON || _opencrg=OFF

_pkgname=chronoengine
pkgname=${_pkgname}-git
pkgver=6.0.0.r2217.g866c9980b
#_fragment="#tag=${pkgver}"
_fragment="#branch=main"
pkgrel=1
pkgdesc="An Open Source Multi-physics Simulation Engine"
license=('custom')
arch=('i686' 'x86_64')
url="https://projectchrono.org/"
depends=(openmpi blas boost-libs hdf5)
((ENABLE_OPENCRG)) && depends+=(opencrg)
makedepends+=(cmake eigen git boost glm glew glfw irrlicht glut openmpi gcc-fortran)
makedepends+=(python swig) # MODULE_PYTHON
makedepends+=('cuda')        # MODULE_GRANULAR
                           # MODULE_PARALLEL optional
makedepends+=(blaze)       # MODULE_PARALLEL required
#makedepends+=(thrust)      # MODULE_PARALLEL required (included in cuda)
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
	"thrust.patch"
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '0fe883cfcc1db869d08235482a3801fa458db15360e0eefac9084c7f2993af4a'
            '4e8ed0097fb14bbe437c2a57e9ef1852fdbfe8675e5345b0af42287d24fbfefe'
            'bf9717a2a1d569e376623d40e9b83fb766629a9ef9acc16e4af5358132202526')

CMAKE_FLAGS=(	-DENABLE_MODULE_POSTPROCESS=ON
		-DENABLE_OPENCRG="$_opencrg"
		-DENABLE_HDF5=ON
		-DENABLE_MODULE_VEHICLE=ON
		-DENABLE_MODULE_PYTHON=ON
		-DENABLE_MODULE_IRRLICHT=ON
		-DENABLE_MODULE_CASCADE=ON
		-DCASCADE_ROOT=/opt/oce
		-DCASCADE_INCLUDE_DIR=/opt/oce/include/oce
		-DENABLE_MODULE_OPENGL=ON
		-DENABLE_MODULE_PARALLEL=ON
		-DTHRUST_INCLUDE_DIR=/opt/cuda/targets/x86_64-linux/include
		-DENABLE_MODULE_MKL=ON
		-DINTEL_ROOT=/opt/intel/mkl
		-DENABLE_MODULE_COSIMULATION=ON
		-DENABLE_MODULE_FSI=ON
		-DENABLE_MODULE_MUMPS=OFF
		-DENABLE_MODULE_DISTRIBUTED=ON
		-DENABLE_MODULE_GRANULAR=ON
		)

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule.src/chrono_thirdparty/googlebenchmark.url "${srcdir}"/benchmark
  git config submodule.src/chrono_thirdparty/googletest.url "${srcdir}"/googletest
  git -c protocol.file.allow=always submodule update
  mapfile -t files < <(find . -name CMakeLists.txt)
  mapfile -t -O ${#files[@]} files < <(find . -name \*.cmake\*)
  sed -i 's/lib64/lib/' "${files[@]}"
  sed -i 's|share/chrono/bin|bin/chronoengine|' CMakeLists.txt
  git apply -v "${srcdir}"/glm.patch
# git apply -v "${srcdir}"/thrust.patch
}

pkgver() {
  git -C ${pkgname} describe --long --tag| sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
