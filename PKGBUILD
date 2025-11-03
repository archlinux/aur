# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name4=graph
_name3=slim
_name2=evals
_name1=examples
_name0=pydantic-ai
_name00=clai
pkgbase=python-$_name0
pkgname=(python-${_name0//-ai/}-$_name4 python-$_name0-$_name3 python-${_name0//-ai/}-$_name2 python-$_name0-$_name1 python-$_name0 python-$_name00)
pkgver=1.9.1
pkgrel=1
arch=('any')
url='https://github.com/pydantic/pydantic-ai'
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-anyio' 'python-asgi-lifespan' 'python-devtools' 'python-dirty-equals' 'python-ddgs' 'python-inline-snapshot' 'python-pytest' 'python-pytest-examples' 'python-pytest-mock' 'python-pytest-recording' 'python-pytest-xdist' 'python-genai-prices' 'ruff' 'deno')
source=("$_name0-$pkgver::git+$url.git#tag=v$pkgver"
        "git+https://github.com/pydantic/mcp-run-python.git"
        "fix-tests.patch")
sha256sums=('5faca813d0b33ea9d47e20c670926a4b2d874e93bacf3ff28922998f86d1194f'
            'SKIP'
            'eb2ddf309b138563e2f9864434500a701c80204783e8eeaf29d63f914b5920c1')

prepare(){
  cd "$srcdir"/$_name0-$pkgver
  patch -Np1 -i ../fix-tests.patch
  sed -i '/mkdocstrings.github.io/d' pydantic_ai_slim/pydantic_ai/_griffe.py
  sed -i '/parser_options/d' pydantic_ai_slim/pydantic_ai/_griffe.py
}

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
    # Need to update snapshots with new Pydantic version
    --deselect tests/test_tools.py::test_google_style_with_returns
    --deselect tests/test_tools.py::test_only_returns_type
    --deselect tests/test_tools.py::test_docstring_unknown
    --deselect tests/test_tools.py::test_schema_generator
    # Failed
    --deselect tests/models/test_model_names.py::test_known_model_names
    --deselect tests/models/test_openai.py::test_strict_mode_cannot_infer_strict
    --deselect tests/models/test_instrumented.py::test_instrumented_model_stream_break
    --deselect tests/models/test_fallback.py::test_all_failed_instrumented
    -k "not fastmcp"
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
  optdepends=('python-logfire: logfire' 'python-opentelemetry-instrumentation-httpx: logfire'
              'python-openai: openai'
              'python-cohere: cohere'
              'python-google-auth: vertexai' 'python-requests: vertexai'
              'python-google-genai: google'
              'python-anthropic: anthropic'
              'python-groq: groq'
              'python-mistralai: mistral'
              'python-boto3: bedrock'
              'python-huggingface-hub: huggingface' 'python-aiohttp: huggingface'
              'python-outlines: outlines-transformers' 'python-accelerate: outlines-transformers' 'python-datasets: outlines-transformers' 'python-transformers: outlines-transformers' 'python-setuptools: outlines-transformers' 'python-pillow: outlines-transformers'
              'python-outlines: outlines-llamacpp' 'python-huggingface-hub: outlines-llamacpp' 'python-llama-cpp: outlines-llamacpp' 'python-numba: outlines-llamacpp'
              'python-outlines: outlines-mlxlm' 'python-datasets: outlines-mlxlm' 'python-mlx: outlines-mlxlm' 'python-mlx-lm: outlines-mlxlm'
              'python-outlines: outlines-sglang' 'python-openai: outlines-sglang'
              'python-vllm: outlines-vllm-offline' 'python-outlines: outlines-vllm-offline'
              'python-ddgs: duckduckgo'
              'python-tavily: tavily'
              'python-rich: cli' 'python-prompt_toolkit: cli' 'python-argcomplete: cli' 'python-pyperclip: cli'
              'python-mcp: mcp'
              'python-fastmcp: fastmcp'
              'python-pydantic-evals: evals'
              'python-starlette: ui'
              'python-fasta2a: a2a'
              'python-ag-ui-protocol: ag-ui'
              'python-starlette: ag-ui'
              'python-tenacity: retries'
              'python-temporalio: temporal'
              'python-dbos: dbos'
              'python-prefect')
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
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-google-genai' 'python-groq' 'python-anthropic' 'python-mistralai' 'python-cohere' 'python-boto3' 'python-huggingface-hub' 'python-aiohttp' 'python-rich' 'python-prompt_toolkit' 'python-argcomplete' 'python-pyperclip' 'python-mcp' 'python-fastmcp' 'python-pydantic-evals' 'python-ag-ui-protocol' 'python-starlette' 'python-tenacity' 'python-temporalio' 'python-logfire' 'python-opentelemetry-instrumentation-httpx' 'python-starlette')
  optdepends=('python-pydantic-ai-examples: examples'
              'python-fasta2a: a2a'
              'python-dbos: dbos'
              'python-prefect: prefect'
              'python-outlines: outlines-transformers' 'python-accelerate: outlines-transformers' 'python-datasets: outlines-transformers' 'python-transformers: outlines-transformers' 'python-setuptools: outlines-transformers' 'python-pillow: outlines-transformers'
              'python-outlines: outlines-llamacpp' 'python-huggingface-hub: outlines-llamacpp' 'python-llama-cpp: outlines-llamacpp' 'python-numba: outlines-llamacpp'
              'python-outlines: outlines-mlxlm' 'python-datasets: outlines-mlxlm' 'python-mlx: outlines-mlxlm' 'python-mlx-lm: outlines-mlxlm'
              'python-outlines: outlines-sglang' 'python-openai: outlines-sglang'
              'python-vllm: outlines-vllm-offline' 'python-outlines: outlines-vllm-offline')
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
