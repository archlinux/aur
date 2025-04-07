# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name4=graph
_name3=slim
_name2=evals
_name1=examples
_name0=pydantic-ai
pkgbase=python-${_name0}
pkgname=(python-${_name0//-ai/}-${_name4} python-${_name0//-ai/}-${_name2} python-${_name0}-${_name3} python-${_name0}-${_name1} python-${_name0})
pkgver=0.0.53
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/pydantic/pydantic-ai'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://github.com/denoland/deno/releases/latest/download/deno-x86_64-unknown-linux-gnu.zip")
source_aarch64=("https://github.com/denoland/deno/releases/latest/download/deno-aarch64-unknown-linux-gnu.zip")
sha256sums=('ea8e369bd01153a2327d8fd5691a8014edc66f1d7e465e2d0985033ddf027418')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
depends=('python>=3.9')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio' 'python-devtools' 'python-dirty-equals' 'python-inline-snapshot' 'python-pytest' 'python-pytest-examples' 'python-pytest-mock' 'python-pytest-pretty' 'python-pytest-recording' 'python-diff-cover')

prepare(){
  # Remove uv-dynamic-versioning dependency as it is not needed
  cd "${srcdir}"/${_name0}-${pkgver}
  sed -i 's/requires = \["hatchling", "uv-dynamic-versioning>=0.7.0"\]/requires = ["hatchling"]/' ${_name0//-ai/_}${_name4}/pyproject.toml
  sed -i '/\[tool\.hatch\.version\]/,+1d' ${_name0//-ai/_}${_name4}/pyproject.toml
  sed -i "s/^dynamic.*/version = \"${pkgver}\"/" ${_name0//-ai/_}${_name4}/pyproject.toml
  sed -i 's/requires = \["hatchling", "uv-dynamic-versioning>=0.7.0"\]/requires = ["hatchling"]/' ${_name0//-/_}_${_name3}/pyproject.toml
  sed -i '/\[tool\.hatch\.version\]/,+1d' ${_name0//-/_}_${_name3}/pyproject.toml
  sed -i "s/^dynamic.*/version = \"${pkgver}\"/" ${_name0//-/_}_${_name3}/pyproject.toml
  sed -i 's/\[tool.hatch.metadata.hooks.uv-dynamic-versioning\]//' ${_name0//-/_}_${_name3}/pyproject.toml
  sed -i "s/{{ version }}/${pkgver}/g" ${_name0//-/_}_${_name3}/pyproject.toml
  sed -i 's/\[tool.hatch.metadata.hooks.uv-dynamic-versioning.optional-dependencies\]/[project.optional-dependencies]/' ${_name0//-/_}_${_name3}/pyproject.toml
  sed -i 's/requires = \["hatchling", "uv-dynamic-versioning>=0.7.0"\]/requires = ["hatchling"]/' ${_name0//-ai/_}${_name2}/pyproject.toml
  sed -i '/\[tool\.hatch\.version\]/,+1d' ${_name0//-ai/_}${_name2}/pyproject.toml
  sed -i "s/^dynamic.*/version = \"${pkgver}\"/" ${_name0//-ai/_}${_name2}/pyproject.toml
  sed -i "s/{{ version }}/${pkgver}/g" ${_name0//-ai/_}${_name2}/pyproject.toml
  sed -i 's/\[tool.hatch.metadata.hooks.uv-dynamic-versioning\]//' ${_name0//-ai/_}${_name2}/pyproject.toml
  sed -i 's/requires = \["hatchling", "uv-dynamic-versioning>=0.7.0"\]/requires = ["hatchling"]/' ${_name1}/pyproject.toml
  sed -i '/\[tool\.hatch\.version\]/,+1d' ${_name1}/pyproject.toml
  sed -i "s/^dynamic.*/version = \"${pkgver}\"/" ${_name1}/pyproject.toml
  sed -i 's/\[tool.hatch.metadata.hooks.uv-dynamic-versioning\]//' ${_name1}/pyproject.toml
  sed -i "s/{{ version }}/${pkgver}/g" ${_name1}/pyproject.toml
  sed -i 's/requires = \["hatchling", "uv-dynamic-versioning>=0.7.0"\]/requires = ["hatchling"]/' pyproject.toml
  sed -i '/\[tool\.hatch\.version\]/,+1d' pyproject.toml
  sed -i "s/^dynamic.*/version = \"${pkgver}\"/" pyproject.toml
  sed -i 's/\[tool.hatch.metadata.hooks.uv-dynamic-versioning\]//' pyproject.toml
  sed -i 's/\[tool.hatch.metadata.hooks.uv-dynamic-versioning.optional-dependencies\]/[project.optional-dependencies]/' pyproject.toml
  sed -i "s/{{ version }}/${pkgver}/g" pyproject.toml
  # Update the file to use the installed one in system
  echo $(python --version | cut -d' ' -f2 | cut -d'.' -f1,2) > .python-version
}

build() {
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m build --wheel --no-isolation ${_name0//-ai/_}${_name4}
  python -m build --wheel --no-isolation ${_name0//-/_}_${_name3}
  python -m build --wheel --no-isolation ${_name0//-ai/_}${_name2}
  python -m build --wheel --no-isolation ${_name1}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    -k "not evals.md"
  )
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m venv --system-site-packages test-env
  ln -sf /usr/bin/ruff test-env/bin/ruff
  test-env/bin/python -m installer ${_name0//-ai/_}${_name4}/dist/*.whl
  test-env/bin/python -m installer ${_name0//-/_}_${_name3}/dist/*.whl
  test-env/bin/python -m installer ${_name0//-ai/_}${_name2}/dist/*.whl
  rm -rf test-env/bin/pai
  test-env/bin/python -m installer ${_name1}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  env PATH="${srcdir}":$PATH test-env/bin/python -m pytest "${pytest_options[@]}" tests
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
  depends+=('python-eval-type-backport' 'python-griffe' 'python-httpx' 'python-pydantic' 'python-pydantic-graph' 'python-opentelemetry-api' 'python-typing-inspection')
  optdepends=('python-logfire: logfire' 'python-openai: openai' 'python-cohere: cohere' 'python-google-auth: vertexai' 'python-requests: vertexai' 'python-anthropic: anthropic' 'python-groq: groq' 'python-mistralai: mistral' 'python-boto3: bedrock' 'python-duckduckgo-search: duckduckgo' 'python-tavily: tavily' 'python-rich: cli' 'python-prompt-toolkit: cli' 'python-argcomplete: cli' 'python-mcp: mcp' 'python-pydantic-evals: evals')
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
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-pydantic-evals' 'python-asyncpg' 'python-fastapi' 'python-logfire' 'python-opentelemetry-instrumentation-asyncpg' 'python-opentelemetry-instrumentation-fastapi' 'python-opentelemetry-instrumentation-sqlite3' 'python-python-multipart' 'python-rich' 'uvicorn' 'python-devtools' 'python-gradio' 'python-mcp' 'python-typer' 'python-dotenv')
  url='https://github.com/pydantic/pydantic-ai/tree/main/examples'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/dist/*.whl
}

package_python-pydantic-ai() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs.'
  depends+=('python-pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-mistralai' 'python-cohere' 'python-boto3' 'python-rich' 'python-prompt-toolkit' 'python-argcomplete' 'python-mcp' 'python-pydantic-evals')
  optdepends=('python-pydantic-ai-examples: examples' 'python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
