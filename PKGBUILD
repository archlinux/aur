# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name3=graph
_name2=slim
_name1=examples
_name0=pydantic-ai
pkgbase=python-${_name0}
pkgname=(python-${_name0//-ai/}-${_name3} python-${_name0}-${_name2} python-${_name0}-${_name1} python-${_name0})
pkgver=0.0.43
pkgrel=1
arch=('any')
url='https://github.com/pydantic/pydantic-ai'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6c391cb2196c5ab18c1eaf606a42a0c7fbf557bf3ecc0db8170b793e4bfbcb5c')
depends=('python>=3.9')
makedepends=('python-hatchling'  'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio' 'python-devtools' 'python-dirty-equals' 'python-inline-snapshot' 'python-pytest' 'python-pytest-examples' 'python-pytest-mock' 'python-pytest-pretty' 'python-pytest-recording' 'python-diff-cover' 'python-httpx')

prepare(){
  # Fix test issue from this commit: https://github.com/pydantic/pydantic-ai/pull/1202
  cd "${srcdir}"/${_name0}-${pkgver}/${_name0//-/_}_${_name2}/${_name0//-/_}/models
  sed -i '/gpt-4.5-preview/d' __init__.py
  sed -i '/gpt-4o-mini-audio-preview-2024-12-17/{
      s/.*/    &\n    '\''gpt-4o-mini-search-preview'\'',/;
      s/.*/    &\n    '\''gpt-4o-mini-search-preview-2025-03-11'\'',/;
      s/.*/    &\n    '\''gpt-4o-search-preview'\'',/;
      s/.*/    &\n    '\''gpt-4o-search-preview-2025-03-11'\'',/;
  }' __init__.py
  sed -i '/openai:gpt-4o-mini-audio-preview-2024-12-17/{
      s/.*/    &\n    '\''openai:gpt-4o-mini-search-preview'\'',/;
      s/.*/    &\n    '\''openai:gpt-4o-mini-search-preview-2025-03-11'\'',/;
      s/.*/    &\n    '\''openai:gpt-4o-search-preview'\'',/;
      s/.*/    &\n    '\''openai:gpt-4o-search-preview-2025-03-11'\'',/;
  }' __init__.py
}

build() {
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m build --wheel --no-isolation ${_name0//-ai/_}${_name3}
  python -m build --wheel --no-isolation ${_name0//-/_}_${_name2}
  python -m build --wheel --no-isolation ${_name1}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/pip install -U ruff --force-reinstall
  test-env/bin/python -m installer ${_name0//-ai/_}${_name3}/dist/*.whl
  test-env/bin/python -m installer ${_name0//-/_}_${_name2}/dist/*.whl
  test-env/bin/python -m installer ${_name1}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package_python-pydantic-graph() {
  pkgdesc='Graph and state machine librarys.'
  depends+=('python-httpx' 'python-logfire-api' 'python-pydantic' 'python-typing-inspection')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0//-ai/_}${_name3}/dist/*.whl
}

package_python-pydantic-ai-slim() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs, slim package.'
  depends+=('python-eval-type-backport' 'python-griffe' 'python-httpx' 'python-pydantic' 'python-pydantic-graph' 'python-opentelemetry-api' 'python-typing-inspection')
  optdepends=('python-logfire: logfire' 'python-openai: openai' 'python-cohere: cohere' 'python-google-auth: vertexai' 'python-requests: vertexai' 'python-anthropic: anthropic' 'python-groq: groq' 'python-mistralai: mistral' 'python-boto3: bedrock' 'python-duckduckgo-search: duckduckgo' 'python-tavily: tavily' 'python-rich: cli' 'python-prompt-toolkit: cli' 'python-argcomplete: cli' 'python-mcp: mcp')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_ai_slim'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name0//-/_}_${_name2}/dist/*.whl
}

package_python-pydantic-ai-examples() {
  pkgdesc='Examples of how to use PydanticAI and what it can do.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-asyncpg' 'python-fastapi' 'python-logfire' 'python-opentelemetry-instrumentation-asyncpg' 'python-opentelemetry-instrumentation-fastapi' 'python-opentelemetry-instrumentation-sqlite3' 'python-python-multipart' 'python-rich' 'uvicorn' 'python-devtools' 'python-gradio' 'python-mcp' 'python-typer' 'python-dotenv')
  url='https://github.com/pydantic/pydantic-ai/tree/main/examples'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/dist/*.whl
}

package_python-pydantic-ai() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-mistralai' 'python-cohere' 'python-boto3' 'python-rich' 'python-prompt-toolkit' 'python-argcomplete' 'python-mcp')
  optdepends=('python-pydantic-ai-examples: examples' 'python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
