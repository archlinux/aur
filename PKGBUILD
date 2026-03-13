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
makedepends+=(opencascade) # MODULE_CASCADE
makedepends+=(splashsurf)  # MODULE_FSI (mesh SPH sim)
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
		"splashsurf: mesh SPH sim in FSI module"
		"intel-mkl: This library is currently used in Chrono for its parallel direct solver (Pardiso)"
		)
source=("${pkgname}::git+https://github.com/projectchrono/chrono.git${_fragment}"
	"git+https://github.com/google/benchmark.git"
	"git+https://github.com/google/googletest.git"
	"chronoengine.sh"
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '0fe883cfcc1db869d08235482a3801fa458db15360e0eefac9084c7f2993af4a')

CMAKE_FLAGS=(	-DCH_ENABLE_MODULE_POSTPROCESS=ON
		-DCH_ENABLE_OPENCRG="$_opencrg"
		-DCH_ENABLE_HDF5=ON
		-DCH_ENABLE_MODULE_VEHICLE=ON
		-DCH_ENABLE_MODULE_PYTHON=ON
		-DCH_ENABLE_MODULE_IRRLICHT=ON
		-DCH_ENABLE_MODULE_CASCADE=ON
		-DCH_ENABLE_MODULE_OPENGL=ON
		-DCH_ENABLE_MODULE_PARALLEL=ON
		-DTHRUST_INCLUDE_DIR=/opt/cuda/targets/x86_64-linux/include
		-DCH_ENABLE_MODULE_MKL=ON
		-DINTEL_ROOT=/opt/intel/mkl
		-DCH_ENABLE_MODULE_VEHICLE_COSIM=ON
		-DCH_ENABLE_MODULE_FSI=ON
		-DCH_ENABLE_MODULE_MUMPS=OFF
		-DCH_ENABLE_MODULE_DISTRIBUTED=ON
		-DCH_ENABLE_MODULE_GRANULAR=ON
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
