# Maintainer: Marc Straube <email@marcstraube.de>
# Contributor: envolution
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# ci|forcedep=python-protobuf|
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-posthog
_name=posthog-python
_tag=posthog-v
pkgver=7.91.2
pkgrel=1
pkgdesc="Integrate PostHog into any python application."
arch=('any')
url="https://posthog.com/docs/libraries/python"
license=('MIT')
depends=(
  'python-distro'
  'python-requests'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-aiohttp'
  'python-anthropic'
  'python-dateutil'
  'python-django'
  'python-fastapi'
  'python-fastmcp'
  'python-flask'
  'python-freezegun'
  'python-gevent'
  'python-google-genai'
  'python-httpx'
  'python-jsonschema'
  'python-langchain'
  'python-langchain-core'
  'python-langchain-openai'
  'python-langgraph'
  'python-mcp'
  'python-openai'
  'python-opentelemetry-exporter-otlp-proto-http'
  'python-opentelemetry-instrumentation'
  'python-opentelemetry-instrumentation-aiohttp-client'
  'python-opentelemetry-instrumentation-django'
  'python-opentelemetry-instrumentation-flask'
  'python-opentelemetry-instrumentation-httpx'
  'python-opentelemetry-instrumentation-requests'
  'python-opentelemetry-instrumentation-sqlite3'
  'python-opentelemetry-instrumentation-system-metrics'
  'python-opentelemetry-instrumentation-wsgi'
  'python-opentelemetry-sdk'
  'python-parameterized'
  'python-pydantic'
  'python-pytest'
  'python-pytest-asyncio'
  'python-pytest-bdd'
  'python-pytest-timeout'
  'python-starlette'
  'python-tiktoken'
  'python-tzdata'
  'python-zstandard'
)
optdepends=(
  'python-anthropic: Anthropic support for LLM Observability'
  'python-django: Django middleware integration'
  'python-fastmcp-slim: FastMCP 2 server instrumentation'
  'python-flask: Flask integration'
  'python-google-genai: Google Gemini SDK support'
  'python-httpx: async client support'
  'python-langchain: LLM observability callback handler'
  'python-langgraph: LangChain agent middleware'
  'python-mcp: MCP server analytics'
  'python-openai: OpenAI SDK support'
  'python-opentelemetry-exporter-otlp-proto-http: OpenTelemetry export'
  'python-opentelemetry-sdk: OpenTelemetry tracing and metrics'
  'python-redis: Redis feature flag cache'
  'python-zstandard: zstd request compression'
)
source=("$_name-$pkgver.tar.gz::https://github.com/PostHog/posthog-python/archive/refs/tags/$_tag$pkgver.tar.gz")
sha256sums=('09729a4cd26a77eff1d2d0b458fb8b13c922b2a33df3b9199a0dbe16f08bf4c1')

build() {
  cd "$_name-$_tag$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$_tag$pkgver"

  # Disable tests requiring network access and API key, upstream CI tooling
  # and integrations whose dependencies are not available in the official repos
  # (Celery, Django REST framework)
  PYTHONPATH="$PWD" pytest \
    --ignore=posthog/test/integrations/test_celery_otel_context.py \
    --ignore=posthog/test/integrations/test_drf_integration.py \
    --ignore=posthog/test/test_posthog_upgrade_workflow.py \
    -k 'not test_feature_flags or test_request'
}

package() {
  cd "$_name-$_tag$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Upstream ships its test suite as part of the package
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir/$site_packages/posthog/test"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:
