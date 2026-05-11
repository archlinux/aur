# Maintainer:  mosra <mosra@centrum.cz>

pkgbase="openmeeg"
pkgname=(
  "${pkgbase}"
  "python-${pkgbase}"
)
pkgver=2.5.16
pkgrel=1
pkgdesc="C++ package for solving the forward problems of electroencephalography (EEG) and magnetoencephalography (MEG)"
arch=(
  'x86_64'
)
url="https://openmeeg.github.io"
_url="https://github.com/${pkgbase}/${pkgbase}"
license=(
  'custom:CeCILL-B'
)
makedepends=(
  'cmake>=3.14'

  # 'blas'
  'hdf5'
  # 'lapack'
  'lapacke'
  'matio'
  'openblas'

  'python>=3.10'
  'python-setuptools>=68.0.0'
  'python-setuptools-scm>=6.2'
  'python-wheel>=0.37.0'
  'python-numpy>=2.0.0rc1'
  'swig>=4.2'
)
# checkdepends=(
#   'python-pytest'
#   'python-threadpoolctl'
# )
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('29485a732e3555425889cfd28474fccd2b3e76b51bb694fc83d86ca052e70884')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_SKIP_RPATH:BOOL=ON
    -D ENABLE_APPS:BOOL=ON
    -D BUILD_TESTING:BOOL=OFF
    -D ENABLE_PYTHON:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   export LD_LIBRARY_PATH="${srcdir}/${_pkgsrc}/build/OpenMEEG:${srcdir}/${_pkgsrc}/build/OpenMEEGMaths:${LD_LIBRARY_PATH}"
#   local ctest_exclude_regex=""
#   local ctest_options=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${ctest_exclude_regex}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_options[@]}"
# }

package_openmeeg() {
  depends=(
    # 'blas'
    'glibc'
    # 'lapack'
    'libgcc'
    'libgomp'
    'libstdc++'
    'matio'
    'openblas'
  )
  provides=(
    "libOpenMEEG.so"
    "libOpenMEEGMaths.so"
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  rm -rf "${pkgdir}/usr/lib/python"*
}

package_python-openmeeg() {
  pkgdesc+=" (Python bindings)"
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'glibc'
    'libgcc'
    'libstdc++'
    'openblas' # ?
    'python>=3.10'
    'python-numpy>=2.0.0rc1'
  )

  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/wrapping/python"

  rm -rf "${pkgdir}${site_packages}/${pkgbase}/tests"
}
