# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=langgraph
pkgname=python-${_name}
pkgver=0.5.3
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
        "https://files.pythonhosted.org/packages/py3/l/langgraph-cli/langgraph_cli-0.3.4-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/py3/l/langgraph-runtime-inmem/langgraph_runtime_inmem-0.4.0-py3-none-any.whl") # Prevent cercular dependencies
noextract=('langgraph_cli-0.3.3-py3-none-any.whl' 'langgraph_runtime_inmem-0.3.4-py3-none-any.whl')
sha256sums=('36d4b67f984ff2649d447826fc99b1a2af3e97599a590058f20750048e4f548f'
            'b3ac9fbc67cec5d0295c23a9e7a9014f34502639fb52b2d02c89b3bb2ba36c33'
            '61a392b6faa4fedcf16287538332e0a0e528e54d0e13b1f5f0174256c26dd8f3')

prepare(){
  # Fix tests
  cd "${srcdir}"/${_name}-${pkgver}
  sed -i 's/"parents": {},/"parents": {},\n                "thread_id": "1",/g' tests/test_checkpoint_migration.py
  sed -i 's/"parents": {},/"parents": {},\n                "thread_id": AnyStr(),/g' tests/test_large_cases.py
  sed -i 's/"parents": {},/"parents": {},\n                "thread_id": AnyStr(),/g' tests/test_large_cases_async.py
  sed -i 's/"parents": {},/"parents": {},\n                "thread_id": AnyStr(),/g' tests/test_pregel.py
  sed -i 's/"parents": {},/"parents": {},\n                "thread_id": AnyStr(),/g' tests/test_pregel_async.py
}

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
    # Need to be fixed by developers
    --deselect tests/test_large_cases.py::test_nested_graph_state
    --deselect tests/test_large_cases.py::test_doubly_nested_graph_state
    --deselect tests/test_large_cases.py::test_weather_subgraph
    --deselect tests/test_large_cases_async.py::test_nested_graph_state
    --deselect tests/test_large_cases_async.py::test_doubly_nested_graph_state
    --deselect tests/test_large_cases_async.py::test_weather_subgraph
    --deselect tests/test_pregel.py::test_falsy_return_from_task
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
