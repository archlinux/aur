# Maintainer: Jean-Louis Queguiner <jlqueguiner@gladia.io>
pkgname=python-words2num2
_pkgname=words2num2
pkgver=0.3.5
pkgrel=1
pkgdesc="Inverse of num2words2: convert spoken-form numbers back to numeric values across 100+ languages."
# A compiled Rust extension (maturin/PyO3), not a pure-Python package.
arch=('x86_64' 'aarch64')
url="https://github.com/gladiaio/words2num2"
license=('LGPL-2.1-only')
# No Python runtime dependencies: the num2words2 renderer is embedded in the
# compiled core, and the CLI uses only the standard library.
depends=('python' 'gcc-libs' 'glibc')
makedepends=('python-build'
             'python-installer'
             'python-maturin'
             'rust')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/w/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
# pkgver and sha256sums are rewritten by .github/workflows/aur-publish.yml
# from the PyPI sdist of each release.
sha256sums=('d689a33e0e003cbaeeab4a71b1ec2cb941f53a193242a4040bd0837c38fd1aca')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # Fetch the crates up front so build() can run offline.
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --manifest-path rust/words2num2-py/Cargo.toml
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  local _site="${srcdir}/test-site"
  rm -rf "${_site}" "${srcdir}/test-run"
  python -m installer --destdir="${_site}" dist/*.whl
  local _platlib
  _platlib=$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')
  # Run a copy of the tests outside the source tree, against the built wheel:
  # from here the source words2num2/ (no compiled _rust) would shadow it.
  mkdir "${srcdir}/test-run"
  cp -r tests REFERENCE.md "${srcdir}/test-run/"
  cd "${srcdir}/test-run"
  PYTHONPATH="${_site}${_platlib}" python -m pytest tests -q
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
