# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="digital_rf"
pkgname=(
  "${pkgbase}"
  "python-${pkgbase}"
)
pkgver=2.6.14
pkgrel=1
pkgdesc="Read, write, and interact with data in the Digital RF and Digital Metadata formats"
arch=(
  'x86_64'
)
url="https://github.com/MITHaystack/${pkgbase}"
license=(
  'BSD-3-Clause'
)
makedepends=(
  # all
  'cmake>=3.20'
  # c
  'hdf5>=1.8'
  # python
  'python-build'
  'hdf5>=1.8'
  'python-mako'
  'python-numpy>=2.0'
  'python>=3.8'
  'python-scikit-build-core>=0.10'
  'python-setuptools-scm'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('09303a1f18ead06c3c0376f1a2c4710e6556d0850d024ee99cb5a98cb1d07182f481b83b53c6cdaef2ad1b60b77abcc59e0198614ba3798ab3e67279c94bac0a')

build() {
  local cmake_arguments=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D ENABLE_MATLAB:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_arguments[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local ctest_exclude_regex=""
  local ctest_arguments=(
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest --test-dir "${_pkgsrc}/build" "${ctest_arguments[@]}"
}

package_digital_rf() {
  depends=(
    'hdf5>=1.8'

    'glibc'
  )
  provides=(
    "lib${pkgname}.so"
  )

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build" # --component libdigital_rf

  cd "${_pkgsrc}"
  install -vDm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -vDm644 "LICENSE"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${pkgdir}/usr"
  rm -rf "bin" "lib/python"*
}

package_python-digital_rf() {
  pkgdesc+=" (Python bindings)"
  depends=(
    'python-h5py'
    'hdf5>=1.8'
    'python-numpy'
    'python-packaging'
    'python>=3.8'
    'python-dateutil'
    'python-six'

    "${pkgbase}>=${pkgver}"
    'glibc'
  )
  optdepends=(
    'gnuradio: gr_digital_rf, thorosmo, thorpluto, thor'
    'python-matplotlib: tools'
    'python-pandas: digital_metadata'
    'python-sounddevice: tools'
    'python-scipy: tools'
    'python-uhd: uhdtodrf'
    'python-watchdog: mirror, ringbuffer, watchdog'

    'python-gnuradio'
    # 'python-pmt' # ???
  )

  cd "${srcdir}/${_pkgsrc}/build/python"
  local python_site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"
  sed -e "s|${python_site_packages}|${pkgdir}${python_site_packages}|g" \
      -i "create_metadata_dir.py"

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build" # --component digital_rf_python

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"

  cd "lib"
  rm -rf "cmake" "pkgconfig" *.so*
}
