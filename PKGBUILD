# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name="pyodide-lock"
pkgname="python-${_name}"
pkgver=0.1.0a8
pkgrel=1
pkgdesc="Tooling to manage the 'pyodide-lock.json' file."
arch=('any')
url="https://github.com/pyodide/pyodide-lock"
license=('BSD-3-Clause')
depends=('python>=3.10' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-build' 'python-typer' 'python-pkginfo' 'python-packaging' 'python-wheel')
optdepends=('python-typer: cli' 'python-pkginfo: wheel' 'python-packaging: wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('9ad5af230d30078aacc1d8055fae6b2273b5a882786eb30cc0b446d69f3af49e')

prepare(){
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  sed -i 's/requires = \["hatchling", "hatch-vcs"\]/requires = ["hatchling"]/' pyproject.toml
}

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
