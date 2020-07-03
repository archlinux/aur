#!/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_pkgname=chronoengine
pkgname=${_pkgname}-git
pkgver=4.0.0.r388.g2d25965db
#_fragment="#tag=${pkgver}"
pkgrel=1
pkgdesc="An Open Source Multi-physics Simulation Engine"
license=('custom')
arch=('i686' 'x86_64')
url="https://projectchrono.org/"
depends=(openmpi boost-libs)
makedepends=(cmake eigen git boost glm glew glfw irrlicht glut openmpi)
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
source=("${pkgname}::git+https://github.com/projectchrono/chrono.git${_fragment}"
	"git+https://github.com/google/benchmark.git"
	"git+https://github.com/google/googletest.git"
	"chronoengine.sh"
	"glm.patch"
	"opencascade.patch"
	)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '0fe883cfcc1db869d08235482a3801fa458db15360e0eefac9084c7f2993af4a'
            '4e8ed0097fb14bbe437c2a57e9ef1852fdbfe8675e5345b0af42287d24fbfefe'
            'bfe6cc1f8018eabc2998c76a12096ba26722c32b8f3244dbc23ec653a5cfe958')

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
