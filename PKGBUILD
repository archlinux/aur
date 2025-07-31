# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph-prebuilt
pkgname=python-${_name}
pkgver=0.6.2
_langgraphver=0.6.2
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
sha256sums=('fb9f4f96d8f26f88bbf997b5b2122ba366d0edf7f3160c653ffa649dff2ec062'
            'b838dd9e56d8cf9d3f5124cad527cec6e03414aaf1a3c284003eaae89d21f32e')
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
