# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="flexiblas"
pkgver=3.5.0
pkgrel=2
pkgdesc="BLAS and LAPACK wrapper library with runtime exchangable backends"
arch=(
  'x86_64'
)
url="https://www.mpi-magdeburg.mpg.de/projects/flexiblas"
license=(
  'LGPL-3.0-or-later'
)
depends=(
  'glibc'
  'libgcc'
  'libgfortran'
  'openblas'
)
makedepends=(
  'cmake>=3.10.0'
  'gcc-fortran>=5.1.0'
)
checkdepends=(
  'lapack'
  'python'
)
provides=(
  "libflexiblas_api.so"
  "libflexiblas_mgmt.so"
  "libflexiblas.so"
)
backup=(
  "etc/flexiblasrc"
  "etc/flexiblasrc.d/NETLIB.conf"
  "etc/flexiblasrc.d/OpenBLASOpenMP.conf"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "https://csc.mpi-magdeburg.mpg.de/mpcsc/software/flexiblas/${_pkgsrc}.tar.xz"
  # "https://gitlab.mpi-magdeburg.mpg.de/api/v4/projects/386/packages/generic/flexiblas-source/v${pkgver}/${_pkgsrc}.tar.xz"
)
sha256sums=('504c0eeac09dca98e4bc930757f44bc409cb770f8fa7578ddb18c0d6accba072')

build() {
  # source /opt/intel/oneapi/setvars.sh
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_SKIP_RPATH:BOOL=ON
    -D MKL_BUILDER:BOOL=OFF
    -D EXAMPLES:BOOL=OFF
    -D LINK_OPENMP:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

check() {
  local ctest_exclude_regex=""
  local ctest_options=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )
  # export LD_LIBRARY_PATH="${srcdir}/${ctest_options[1]}/build/lib:${LD_LIBRARY_PATH}"

  cd "${srcdir}"
  ctest "${ctest_options[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
