# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="openmeeg"
pkgname=(
  "${pkgbase}"
  "python-${pkgbase}"
)
pkgver=2.5.16
pkgrel=2
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

  'eigen'
  'expat>=2.2.1'
  'fast_float'
  # 'flexiblas'
  'hdf5'
  'lapacke'
  'matio'
  'nlohmann-json'
  'openblas'
  'utf8cpp'
  'vtk'

  'python>=3.10'
  'python-setuptools>=68.0.0'
  'python-setuptools-scm>=6.2'
  'python-wheel>=0.37.0'
  'python-numpy>=2.0.0rc1'
  'swig>=4.2'
)
checkdepends=(
  'python-pytest'
  'python-threadpoolctl'
)
options=(
  '!lto' # check()
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  # "${pkgbase}_use_builtin_find_blas_lapack.patch"
  # "${pkgbase}_cmake4.patch"
)
sha256sums=('29485a732e3555425889cfd28474fccd2b3e76b51bb694fc83d86ca052e70884')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://src.fedoraproject.org/rpms/openmeeg
  # patch -Np1 -i "${srcdir}/${pkgbase}_use_builtin_find_blas_lapack.patch"
  # patch -Np1 -i "${srcdir}/${pkgbase}_cmake4.patch"
}

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
    -D BUILD_TESTING:BOOL=ON
    -D TEST_HEAD3:BOOL=ON
    -D ENABLE_PYTHON:BOOL=ON
    -D USE_VTK:BOOL=ON
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
  export LD_LIBRARY_PATH="${srcdir}/${ctest_options[1]}/OpenMEEG:${srcdir}/${ctest_options[1]}/OpenMEEGMaths:${LD_LIBRARY_PATH}"

  cd "${srcdir}"
  ctest "${ctest_options[@]}"
}

package_openmeeg() {
  depends=(
    # 'flexiblas'
    'glibc'
    'libgcc'
    'libgomp'
    'libstdc++'
    'matio'
    'openblas'
    'vtk'
  )
  provides=(
    "libOpenMEEG.so"
    "libOpenMEEGMaths.so"
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.rst"  -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgbase}"

  rm -rf "${pkgdir}/usr/lib/python"*
}

package_python-openmeeg() {
  pkgdesc+=" (Python bindings)"
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    # 'flexiblas'
    'glibc'
    'libgcc'
    'libstdc++'
    'openblas'
    'python>=3.10'
    'python-numpy>=2.0.0rc1'
  )

  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build/wrapping/python"

  rm -rf "${pkgdir}${site_packages}/${pkgbase}/tests"
}
