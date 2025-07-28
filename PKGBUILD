# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-prebuilt
pkgname=python-${_name}
pkgver=0.6.0
_langgraphver=0.6.0
pkgrel=1
pkgdesc="Library with high-level APIs for creating and executing LangGraph agents and tools."
arch=('any')
license=('MIT')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/prebuilt"
depends=('python' 'python-langgraph-checkpoint' 'python-langchain-core')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
_langgraph_depends=('python-langgraph-sdk' 'python-xxhash' 'python-pydantic')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' 'python-pytest-watcher' ${_langgraph_depends[@]} 'python-langgraph-checkpoint-sqlite' 'python-langgraph-checkpoint-postgres' 'python-syrupy' )
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/py3/l/langgraph/langgraph-${_langgraphver}-py3-none-any.whl") # Prevent cercular dependencies
sha256sums=('15b97f9d6f4cd5a2c460f6e75774098b22ba03ac9c21c283493d49e586a3863b'
            'fd8596c2469902f41df627b155a4d3e30fd782f728dcbd6f526a213c630514e2')
noextract=("langgraph-${_langgraphver}-py3-none-any.whl")

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need running PostgreSQL server
    -k "not postgres"
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "${srcdir}"/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
