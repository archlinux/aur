# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph
pkgname=python-${_name}
pkgver=0.6.3
_cliver=0.3.6
_inmemver=0.6.8
pkgrel=1
pkgdesc="Building stateful, multi-actor applications with LLMs."
arch=('any')
url="https://github.com/langchain-ai/langgraph/tree/main/libs/langgraph"
license=('MIT')
depends=('python' 'python-langchain-core' 'python-langgraph-checkpoint' 'python-langgraph-sdk' 'python-langgraph-prebuilt' 'python-xxhash' 'python-pydantic')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
_langgraph_cli_depends=('python-click' 'python-dotenv')
_langgraph_runtime_inmem_depends=('python-blockbuster' 'python-structlog' 'python-sse-starlette' 'python-starlette')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-syrupy' 'python-httpx' 'python-pytest-watcher' 'python-pytest-xdist' 'python-psutil' 'python-pytest-repeat' 'python-langgraph-checkpoint-sqlite' 'python-langgraph-checkpoint-postgres' 'python-psycopg' 'python-pycryptodome' ${_langgraph_cli_depends[@]} ${_langgraph_runtime_inmem_depends[@]})
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/py3/l/langgraph-cli/langgraph_cli-${_cliver}-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/py3/l/langgraph-runtime-inmem/langgraph_runtime_inmem-${_inmemver}-py3-none-any.whl") # Prevent cercular dependencies
noextract=("langgraph_cli-${_cliver}-py3-none-any.whl" "langgraph_runtime_inmem-${_inmemver}-py3-none-any.whl")
sha256sums=('0d2280d295133dc34ccc12eae1ad4d82ee847b009c59801de418068fa9248e1b'
            '86aebbb81cde5492f80ddecce3c814ccf492debf17212b185b718e6f6cdb7c88'
            '749dbd1897eec1c46512f5723de7133369d5076bdadb6d164ce5c70f52ad48c6')

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need running PostgreSQL server
    -k "not postgres"
    # Tests for LangGraph developers
    --deselect tests/test_remote_graph.py::test_remote_graph_basic_invoke
    --deselect tests/test_remote_graph.py::test_remote_graph_stream_messages_tuple
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "${srcdir}"/langgraph_cli-*-py3-none-any.whl
  test-env/bin/python -m installer "${srcdir}"/langgraph_runtime_inmem-*-py3-none-any.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
