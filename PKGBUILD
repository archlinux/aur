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
pkgver=9.0.1.r323.7007afec56
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
	"chronoengine.sh"
	)
sha256sums=('SKIP'
            '0fe883cfcc1db869d08235482a3801fa458db15360e0eefac9084c7f2993af4a'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

CMAKE_FLAGS=(	-DCH_ENABLE_MODULE_POSTPROCESS=ON
		-DCH_ENABLE_OPENCRG="$_opencrg"
		-DCH_ENABLE_HDF5=ON
		-DCH_ENABLE_MODULE_VEHICLE=ON
		-DCH_ENABLE_MODULE_PYTHON=ON
		-DCH_ENABLE_MODULE_IRRLICHT=ON
		-DCH_ENABLE_MODULE_CASCADE=ON
		-DCH_ENABLE_MODULE_OPENGL=ON
		-DCH_ENABLE_MODULE_PARALLEL=ON
		-DTHRUST_INCLUDE_DIR=/opt/cuda/targets/x86_64-linux/include/cccl
		-DCH_ENABLE_MODULE_MKL=ON
		-DINTEL_ROOT=/opt/intel/mkl
		-DCH_ENABLE_MODULE_VEHICLE_COSIM=ON
		-DCH_ENABLE_MODULE_FSI=ON
		-DCH_ENABLE_MODULE_MUMPS=OFF
		-DCH_ENABLE_MODULE_DISTRIBUTED=ON
		-DCH_ENABLE_MODULE_GRANULAR=ON
		)

prepare() {
  prepare_submodule
  cd ${pkgname}
  mapfile -t files < <(find . -name CMakeLists.txt)
  mapfile -t -O ${#files[@]} files < <(find . -name \*.cmake\*)
  sed -i 's/lib64/lib/' "${files[@]}"
  sed -i 's|share/chrono/bin|bin/chronoengine|' CMakeLists.txt
}

pkgver() {
# shellcheck disable=SC2183,SC2046
  printf "%sr%s.%s" \
     $(grep -zoP 'set\(CHRONO_VERSION_(MAJOR|MINOR|PATCH) \K\d+' $pkgname/CMakeLists.txt|tr '\0' '.') \
    "$(git -C $pkgname rev-list "$(git -C $pkgname describe --tags --abbrev=0)"..HEAD --count)" \
    "$(git -C $pkgname log --pretty=format:'%h' -n 1)"
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

# Generated with git_submodule_PKGBUILD_conf.sh ( https://gist.github.com/bartoszek/41a3bfb707f1b258de061f75b109042b )
# Call prepare_submodule in prepare() function

prepare_submodule() {
  git -C "$srcdir/chronoengine-git" config submodule.src/chrono_thirdparty/googletest.url "$srcdir/googletest"
  git -C "$srcdir/chronoengine-git" config submodule.src/chrono_thirdparty/googlebenchmark.url "$srcdir/benchmark"
  git -C "$srcdir/chronoengine-git" config submodule.src/chrono_thirdparty/flatbuffers.url "$srcdir/flatbuffers"
  git -C "$srcdir/chronoengine-git" config submodule.src/chrono_thirdparty/fmu-forge.url "$srcdir/fmu-forge"
  git -C "$srcdir/chronoengine-git" config submodule.src/chrono_thirdparty/HydroChrono.url "$srcdir/HydroChrono"
  git -C "$srcdir/chronoengine-git" -c protocol.file.allow=always submodule update --init
}
source+=(
  "googletest::git+https://github.com/google/googletest"
  "benchmark::git+https://github.com/google/benchmark"
  "flatbuffers::git+https://github.com/google/flatbuffers"
  "fmu-forge::git+https://github.com/projectchrono/fmu-forge"
  "HydroChrono::git+https://github.com/Project-SEA-Stack/HydroChrono"
)
