# Maintainer: Jean-Louis Queguiner <jlqueguiner@gladia.io>
pkgname=python-num2words2
_pkgname=num2words2
pkgver=1.0.21
pkgrel=1
pkgdesc="Rust port of the num2words conversion engine with a Python binder: number-to-words in 120+ languages."
# A compiled Rust extension (maturin/PyO3), not a pure-Python package.
arch=('x86_64' 'aarch64')
url="https://github.com/gladiaio/gladia-enterprise/tree/main/oss/num2words2"
license=('LGPL-2.1-only')
# No Python runtime dependencies: the conversion engine is the compiled core.
depends=('python' 'gcc-libs' 'glibc')
makedepends=('python-build'
             'python-installer'
             'python-maturin'
             'rust')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/n/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
# pkgver and sha256sums are rewritten by .github/workflows/oss-release.yml (the aur job)
# from the PyPI sdist of each release.
sha256sums=('a1c57b15c257db6059a57f2293c3aa8d29b5e8d955c3bbcfe6deacff06b4dcdf')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # Fetch the crates up front so build() can run offline.
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --manifest-path rust/num2words2-py/Cargo.toml
}

build() {
  cd "${_pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  # The slim build, as PyPI ships it: no lingua language models (~140 MB); pass an explicit
  # lang to num2words_sentence.
  MATURIN_PEP517_ARGS=--no-default-features python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  local _site="${srcdir}/test-site"
  rm -rf "${_site}" "${srcdir}/test-run"
  python -m installer --destdir="${_site}" dist/*.whl
  local _platlib
  _platlib=$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')
  # Run a copy of the tests outside the source tree, against the built wheel:
  # from here the source num2words2/ (no compiled _rust) would shadow it.
  mkdir "${srcdir}/test-run"
  cp -r tests REFERENCE.md "${srcdir}/test-run/"
  cd "${srcdir}/test-run"
  PYTHONPATH="${_site}${_platlib}" python -m pytest tests -q
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
