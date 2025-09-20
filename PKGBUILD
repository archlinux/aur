# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name4=graph
_name3=slim
_name2=evals
_name1=examples
_name0=pydantic-ai
_name00=clai
pkgbase=python-$_name0
pkgname=(python-${_name0//-ai/}-$_name4 python-$_name0-$_name3 python-${_name0//-ai/}-$_name2 python-$_name0-$_name1 python-$_name0 python-$_name00)
pkgver=1.0.10
pkgrel=1
arch=('any')
url='https://github.com/pydantic/pydantic-ai'
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-anyio' 'python-asgi-lifespan' 'python-devtools' 'python-dirty-equals' 'python-ddgs' 'python-inline-snapshot' 'python-pytest' 'python-pytest-examples' 'python-pytest-mock' 'python-pytest-recording' 'python-pytest-xdist' 'python-genai-prices' 'ruff' 'deno')
source=("$_name0-$pkgver::git+$url.git#tag=v$pkgver"
        "git+https://github.com/pydantic/mcp-run-python.git")
sha256sums=('023da58d5d6e269f774b473a86853421fa64793f6d809890a7e2b145a843c9c6'
            'SKIP')

build() {
  cd "$srcdir"/$_name0-$pkgver
  python -m build --wheel --no-isolation ${_name0//-ai/_}$_name4
  python -m build --wheel --no-isolation ${_name0//-/_}_$_name3
  python -m build --wheel --no-isolation ${_name0//-ai/_}$_name2
  python -m build --wheel --no-isolation $_name1
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation $_name00
  cd "$srcdir"/mcp-run-python
  python build/build.py
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -n auto
    # Failed with opentelemetry>=1.35.0
    --deselect tests/models/test_instrumented.py::test_instrumented_model_stream
    --deselect tests/models/test_instrumented.py::test_instrumented_model_stream_break
    --deselect tests/models/test_instrumented.py::test_instrumented_model
    -k "not instrumentation_settings_event_mode.py and not instrument3"
    # Failed
    --deselect tests/test_tools.py
  )
  cd "$srcdir"/$_name0-$pkgver
  python -m venv --system-site-packages test-env
  ln -sf /usr/bin/ruff test-env/bin/ruff
  test-env/bin/python -m installer ${_name0//-ai/_}$_name4/dist/*.whl
  test-env/bin/python -m installer ${_name0//-/_}_$_name3/dist/*.whl
  rm -rf test-env/bin/pai
  test-env/bin/python -m installer ${_name0//-ai/_}$_name2/dist/*.whl
  test-env/bin/python -m installer $_name1/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer $_name00/dist/*.whl
  test-env/bin/python -m installer ../mcp-run-python/dist/*.whl
  test-env/bin/mcp-run-python example --deps=numpy
  PATH="$srcdir"/$_name0-$pkgver/test-env/bin:$PATH test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package_python-pydantic-graph() {
  pkgdesc='Graph and state machine librarys.'
  depends+=('python-httpx' 'python-logfire-api' 'python-pydantic' 'python-typing-inspection')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" ${_name0//-ai/_}$_name4/dist/*.whl
}

package_python-pydantic-ai-slim() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs, slim package.'
  depends+=('python-griffe' 'python-httpx' 'python-pydantic' 'python-pydantic-graph' 'python-opentelemetry-api' 'python-typing-inspection' 'python-genai-prices')
  optdepends=('python-logfire: logfire' 'python-opentelemetry-instrumentation-httpx: logfire' 'python-openai: openai' 'python-cohere: cohere' 'python-google-auth: vertexai' 'python-requests: vertexai' 'python-google-genai: google' 'python-anthropic: anthropic' 'python-groq: groq' 'python-mistralai: mistral' 'python-boto3: bedrock' 'python-huggingface-hub: huggingface' 'python-aiohttp: huggingface' 'python-ddgs: duckduckgo' 'python-tavily: tavily' 'python-rich: cli' 'python-prompt-toolkit: cli' 'python-argcomplete: cli' 'python-pyperclip: cli' 'python-mcp: mcp' 'python-pydantic-evals: evals' 'python-fasta2a: a2a' 'python-ag-ui-protocol: ag-ui' 'python-starlette: ag-ui' 'python-tenacity: retries' 'python-temporalio: temporal' 'python-dbos: dbos')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_ai_slim'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" ${_name0//-/_}_$_name3/dist/*.whl
}

package_python-pydantic-evals() {
  pkgdesc='Framework for evaluating stochastic code execution, especially code making use of LLMs.'
  depends+=('python-rich' 'python-logfire-api' 'python-pydantic' 'python-pydantic-ai-slim' 'python-anyio' 'python-pyyaml')
  optdepends=('python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_evals'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" ${_name0//-ai/_}$_name2/dist/*.whl
}

package_python-pydantic-ai-examples() {
  pkgdesc='Examples of how to use PydanticAI and what it can do.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-ag-ui-protocol' 'python-starlette' 'python-pydantic-evals' 'python-asyncpg' 'python-fastapi' 'python-logfire' 'python-opentelemetry-instrumentation-asyncpg' 'python-opentelemetry-instrumentation-fastapi' 'python-opentelemetry-instrumentation-sqlite3' 'python-opentelemetry-instrumentation-httpx' 'python-python-multipart' 'python-rich' 'uvicorn' 'python-devtools' 'python-gradio' 'python-mcp' 'python-typer' 'python-dotenv' 'python-modal' 'python-duckdb' 'python-datasets' 'python-pandas')
  url='https://github.com/pydantic/pydantic-ai/tree/main/examples'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" $_name1/dist/*.whl
}

package_python-pydantic-ai() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-google-genai' 'python-groq' 'python-anthropic' 'python-mistralai' 'python-cohere' 'python-boto3' 'python-huggingface-hub' 'python-aiohttp' 'python-rich' 'python-prompt-toolkit' 'python-argcomplete' 'python-pyperclip' 'python-mcp' 'python-pydantic-evals' 'python-ag-ui-protocol' 'python-starlette' 'python-tenacity' 'python-temporalio' 'python-logfire' 'python-opentelemetry-instrumentation-httpx')
  optdepends=('python-pydantic-ai-examples: examples' 'python-fasta2a: a2a' 'python-dbos: dbos')
  url='https://github.com/pydantic/pydantic-ai/'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-clai() {
  pkgdesc='PydanticAI CLI: command line interface to chat to LLMs.'
  depends+=('python-pydantic-ai')
  url='https://github.com/pydantic/pydantic-ai/tree/main/clai'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" $_name00/dist/*.whl
}
