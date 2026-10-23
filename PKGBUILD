# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=vodozemac
pkgname=python-vodozemac
pkgver=0.10.0
pkgrel=1
pkgdesc="Python bindings for vodozemac"
arch=('x86_64' 'aarch64')
url="https://github.com/matrix-nio/vodozemac-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-maturin' 'rust')
checkdepends=('python-pytest' 'python-hypothesis')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9602edb87ab7d16e7b4aad5a087473d8fb6b3ee99043f9aaf0f54bb78970dde9')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # The generated Rust SBOM embeds the absolute "$srcdir" path, we don't need it.
  if ! grep -q '^\[tool\.maturin\.sbom\]$' pyproject.toml; then
    printf '\n[tool.maturin.sbom]\nrust = false\n' >> pyproject.toml
  fi
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "${_pkgname}-${pkgver}"
  python -m venv --clear --system-site-packages --without-pip test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -I -m pytest -vv
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
