# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: a821

pkgbase="hnswlib"
pkgname=(
  "${pkgbase}"
  # "python-${pkgbase}"
)
pkgver=0.9.0
pkgrel=1
pkgdesc="Header-only C++ library for fast approximate nearest neighbors"
arch=(
  'x86_64'
)
url="https://github.com/nmslib/${pkgbase}"
license=(
  'Apache-2.0'
)
makedepends=(
  'cmake'

  # 'python-setuptools>=42'
  # 'python-wheel'
  # 'python-numpy>=1.10.0'
  # 'pybind11>=2.0'

  # 'python-build'
  # 'python-installer'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('65dfb6639cb7d1acbdaeec1429b978fb657a9bf368ebb8353109167394537823')

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build-cmake"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D HNSWLIB_EXAMPLES:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"

  # cd "${_pkgsrc}"
  # python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  find "build-cmake" -maxdepth 1 -type f -executable -name '*_test' -exec ./"{}" \;

  # local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
  # PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version}" \
  #   python -m unittest discover --start-directory tests/python --pattern "bindings_test*.py"
}

package_hnswlib() {
  arch=(
    'any'
  )
  optdepends=(
    "python-${pkgbase}: Python bindings"
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build-cmake"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-hnswlib() {
  pkgdesc+=" (Python bindings)"
  depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'python'
    'python-numpy>=1.10.0'
  )

  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "${site_packages}/${pkgbase}-${pkgver}.dist-info/licenses/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
