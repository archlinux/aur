# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.47.0
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-asyncio python-time-machine python-tree-sitter-languages)
optdepends=('python-tree-sitter: for syntax highlighting support'
  'python-tree-sitter-languages: for custom languages support'
  'python-textual-dev: tools for developers')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('815acd01c453c0209a35880315cb240ff3c137076d2ca17f2b9836e80fa7d7b9a1b53d8accdc8b9ab52b6ad5575ec1d09991a56d48b10825ee308534ade65f17')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_markdown.py \
    --ignore=tests/test_markdownviewer.py \
    --ignore=tests/snapshot_tests/test_snapshots.py \
    -k 'not textual_env_var'
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
