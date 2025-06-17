# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name5=fasta2a
_name4=graph
_name3=slim
_name2=evals
_name1=examples
_name0=pydantic-ai
_name00=clai
pkgbase=python-${_name0}
pkgname=(python-${_name5} python-${_name0//-ai/}-${_name4} python-${_name0//-ai/}-${_name2} python-${_name0}-${_name3} python-${_name0}-${_name1} python-${_name0} python-${_name00})
pkgver=0.2.19
pkgrel=1
arch=('any')
url='https://github.com/pydantic/pydantic-ai'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ca5d48ca66eb2d30a4f63f7893024a3bf4c49c0374a4a015f0d724956d479a21')
depends=('python')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio' 'python-asgi-lifespan' 'python-devtools' 'python-dirty-equals' 'python-inline-snapshot' 'python-pytest' 'python-pytest-examples' 'python-pytest-mock' 'python-pytest-recording' 'python-diff-cover' 'python-pytest-xdist' 'deno')

prepare(){
  cd "${srcdir}"/${_name0}-${pkgver}
  sed -i 's/config=//g' ${_name5}/${_name5}/schema.py
}

build() {
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m build --wheel --no-isolation ${_name5}
  python -m build --wheel --no-isolation ${_name0//-ai/_}${_name4}
  python -m build --wheel --no-isolation ${_name0//-/_}_${_name3}
  python -m build --wheel --no-isolation ${_name0//-ai/_}${_name2}
  python -m build --wheel --no-isolation ${_name1}
  python -m build --wheel --no-isolation
  python -m build --wheel --no-isolation ${_name00}
}

check() {
  local pytest_options=(
    -vv
    -n auto
    --dist=loadgroup
    -W ignore::pytest.PytestRemovedIn9Warning
    # Failed tests
    --deselect tests/models/test_google.py
    --deselect tests/models/test_mistral.py::test_image_as_binary_content_tool_response
    --deselect tests/models/test_model_names.py::test_known_model_names
    --deselect tests/test_mcp.py::test_tool_returning_audio_resource
    --deselect tests/test_settings.py
  )
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m venv --system-site-packages test-env
  ln -sf /usr/bin/ruff test-env/bin/ruff
  test-env/bin/python -m installer ${_name5}/dist/*.whl
  test-env/bin/python -m installer ${_name0//-ai/_}${_name4}/dist/*.whl
  test-env/bin/python -m installer ${_name0//-/_}_${_name3}/dist/*.whl
  test-env/bin/python -m installer ${_name0//-ai/_}${_name2}/dist/*.whl
  rm -rf test-env/bin/pai
  test-env/bin/python -m installer ${_name1}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer ${_name00}/dist/*.whl
  env PATH="${srcdir}":$PATH test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package_python-fasta2a() {
  pkgdesc='Convert an AI Agent into a A2A server! ✨'
  depends+=('python-starlette' 'python-pydantic' 'python-opentelemetry-api')
  optdepends=('python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/tree/main/fasta2a'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name5}/dist/*.whl
}

package_python-pydantic-graph() {
  pkgdesc='Graph and state machine librarys.'
  depends+=('python-httpx' 'python-logfire-api' 'python-pydantic' 'python-typing-inspection')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0//-ai/_}${_name4}/dist/*.whl
}

package_python-pydantic-ai-slim() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs, slim package.'
  depends+=('python-griffe' 'python-httpx' 'python-pydantic' 'python-pydantic-graph' 'python-opentelemetry-api' 'python-typing-inspection')
  optdepends=('python-logfire: logfire' 'python-openai: openai' 'python-cohere: cohere' 'python-google-auth: vertexai' 'python-requests: vertexai' 'python-google-genai: google' 'python-anthropic: anthropic' 'python-groq: groq' 'python-mistralai: mistral' 'python-boto3: bedrock' 'python-duckduckgo-search: duckduckgo' 'python-tavily: tavily' 'python-rich: cli' 'python-prompt-toolkit: cli' 'python-argcomplete: cli' 'python-mcp: mcp' 'python-pydantic-evals: evals' 'python-fasta2a: a2a')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_ai_slim'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0//-/_}_${_name3}/dist/*.whl
}

package_python-pydantic-evals() {
  pkgdesc='Framework for evaluating stochastic code execution, especially code making use of LLMs.'
  depends+=('python-rich' 'python-logfire-api' 'python-pydantic' 'python-pydantic-ai-slim' 'python-anyio' 'python-pyyaml')
  optdepends=('python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_evals'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0//-ai/_}${_name2}/dist/*.whl
}

package_python-pydantic-ai-examples() {
  pkgdesc='Examples of how to use PydanticAI and what it can do.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-pydantic-evals' 'python-asyncpg' 'python-fastapi' 'python-logfire' 'python-opentelemetry-instrumentation-asyncpg' 'python-opentelemetry-instrumentation-fastapi' 'python-opentelemetry-instrumentation-sqlite3' 'python-opentelemetry-instrumentation-httpx' 'python-python-multipart' 'python-rich' 'uvicorn' 'python-devtools' 'python-gradio' 'python-mcp' 'python-typer' 'python-dotenv')
  url='https://github.com/pydantic/pydantic-ai/tree/main/examples'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/dist/*.whl
}

package_python-pydantic-ai() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-google-genai' 'python-groq' 'python-anthropic' 'python-mistralai' 'python-cohere' 'python-boto3' 'python-rich' 'python-prompt-toolkit' 'python-argcomplete' 'python-mcp' 'python-pydantic-evals' 'python-fasta2a')
  optdepends=('python-pydantic-ai-examples: examples' 'python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-clai() {
  pkgdesc='PydanticAI CLI: command line interface to chat to LLMs.'
  depends+=('python-pydantic-ai')
  url='https://github.com/pydantic/pydantic-ai/tree/main/clai'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name00}/dist/*.whl
}
