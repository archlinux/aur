# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyoxipng
pkgname=python-${_base}
pkgdesc="Python wrapper for multithreaded .png image file optimizer oxipng"
pkgver=9.1.1
pkgrel=3
arch=(x86_64)
url="https://github.com/nfrasser/${_base}"
license=(MIT)
depends=(python oxipng)
makedepends=(python-build python-installer python-maturin python-wheel rust cargo)
checkdepends=(python-pytest)
options+=("!lto")
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9c38bf6ebbaea38109bb6136d0d3376de8130fa219ea03db7a1e1e6bcaeb5b980b0908002f1ff0b840c6851703137d767da0a0e718d4df7a641e3f1438d6d07d')

prepare() {
  cd ${_base}-${pkgver}

  # Use an isolated CARGO_HOME so we can reliably locate and patch the vendored
  # libdeflate-sys sources after cargo fetch downloads them.
  export CARGO_HOME="${srcdir}/cargo-home"

  # Download the Rust dependencies without building.
  cargo fetch

  # Work around libdeflate-sys 1.24.0 failing to build with GCC 16+, which
  # dropped support for the evex512 target attribute.
  # Upstream fix: https://github.com/ebiggers/libdeflate/commit/6bb493615b0ef35c98fc4aa4ec04f448788db6a5
  local libdeflate_dir
  libdeflate_dir=$(ls -d "${CARGO_HOME}"/registry/src/*/libdeflate-sys-1.24.0)

  # Locate the vendored libdeflate C source files (exact subdirectory varies by crate version).
  local cpu_features adler32_impl crc32_impl
  cpu_features=$(find "${libdeflate_dir}" -name cpu_features.h -path '*/x86/*' | head -1)
  adler32_impl=$(find "${libdeflate_dir}" -name adler32_impl.h -path '*/x86/*' | head -1)
  crc32_impl=$(find "${libdeflate_dir}" -name crc32_impl.h -path '*/x86/*' | head -1)

  # cpu_features.h: drop the whole EVEX512/NO_EVEX512 macro block (8 lines).
  sed -i '/GCC_PREREQ(14, 0) || CLANG_PREREQ(18, 0, 18000000)/,/#endif$/d' "${cpu_features}"

  # adler32_impl.h: replace NO_EVEX512)/EVEX512) with ) in ATTRIBUTES macros.
  sed -i 's/ NO_EVEX512)/)/g; s/ EVEX512)/)/g' "${adler32_impl}"

  # crc32_impl.h: replace NO_EVEX512)/EVEX512) with ) in ATTRIBUTES macros.
  sed -i 's/ NO_EVEX512)/)/g; s/ EVEX512)/)/g' "${crc32_impl}"
}

build() {
  cd ${_base}-${pkgver}

  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
