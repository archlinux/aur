# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name3=graph
_name2=slim
_name1=examples
_name0=pydantic-ai
pkgbase=python-${_name0}
pkgname=(python-${_name0//-ai/}-${_name3} python-${_name0}-${_name2} python-${_name0}-${_name1} python-${_name0})
pkgver=0.0.24
pkgrel=5
arch=('any')
url='https://github.com/pydantic/pydantic-ai'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('86f5f5162bd1120b7b87909c70fc66d8cdac333a725d1f489a33cfd7cc1266f3')
depends=('python>=3.9')
makedepends=('python-hatchling'  'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio' 'python-devtools' 'python-coverage' 'python-dirty-equals' 'python-inline-snapshot' 'python-pytest' 'python-pytest-examples' 'python-pytest-mock' 'python-pytest-pretty' 'python-diff-cover')

build() {
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m build --wheel --no-isolation ${_name0//-ai/_}${_name3}
  python -m build --wheel --no-isolation ${_name0//-/_}_${_name2}
  python -m build --wheel --no-isolation ${_name1}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    # Make issue in GitHub about those (https://github.com/pydantic/pydantic-ai/issues/965)
    --deselect tests/graph/test_history.py::test_dump_load_history[graph0]
    --deselect tests/graph/test_history.py::test_dump_load_history[graph1]
    --deselect tests/graph/test_history.py::test_dump_load_history[graph2]
    --deselect tests/graph/test_history.py::test_dump_load_history[graph3]
    --deselect tests/graph/test_state.py::test_run_graph
    --deselect tests/models/test_cohere.py::test_request_simple_success
    --deselect tests/models/test_cohere.py::test_request_tool_call
    --deselect tests/models/test_model_function.py::test_weather
    --deselect tests/models/test_model_function.py::test_call_all
    --deselect tests/models/test_model_test.py::test_tool_retry
    --deselect tests/test_agent.py::test_result_pydantic_model_retry
    --deselect tests/test_agent.py::test_result_validator
    --deselect tests/test_agent.py::test_run_sync_multiple
  )
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_name0//-ai/_}${_name3}/dist/*.whl
  test-env/bin/python -m installer ${_name0//-/_}_${_name2}/dist/*.whl
  test-env/bin/python -m installer ${_name1}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests -vv --override-ini="addopts="
}

package_python-pydantic-graph() {
  pkgdesc='Graph and state machine librarys.'
  depends+=('python-httpx' 'python-logfire-api' 'python-pydantic')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0//-ai/_}${_name3}/dist/*.whl
}

package_python-pydantic-ai-slim() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs, slim package.'
  depends+=('python-eval-type-backport' 'python-griffe' 'python-httpx' 'python-logfire-api' 'python-pydantic' 'python-pydantic-graph')
  optdepends=('python-logfire: logfire' 'python-openai: openai' 'python-cohere: cohere' 'python-google-auth: vertexai' 'python-requests: vertexai' 'python-anthropic: anthropic' 'python-groq: groq' 'python-mistralai: mistral')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_ai_slim'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0//-/_}_${_name2}/dist/*.whl
}

package_python-pydantic-ai-examples() {
  pkgdesc='Examples of how to use PydanticAI and what it can do.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-asyncpg' 'python-fastapi' 'python-logfire' 'python-opentelemetry-instrumentation-asyncpg' 'python-opentelemetry-instrumentation-fastapi' 'python-opentelemetry-instrumentation-sqlite3' 'python-python-multipart' 'python-rich' 'uvicorn' 'python-devtools' 'python-gradio')
  url='https://github.com/pydantic/pydantic-ai/tree/main/examples'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/dist/*.whl
}

package_python-pydantic-ai() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-mistralai' 'python-cohere')
  optdepends=('python-pydantic-ai-examples: examples' 'python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
