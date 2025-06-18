# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-posthog
_name=posthog-python
pkgver=5.1.0
pkgrel=1
pkgdesc="Integrate PostHog into any python application."
arch=('any')
url="https://posthog.com/docs/libraries/python"
license=('MIT')
depends=(
  'python-backoff'
  'python-dateutil'
  'python-distro'
  'python-requests'
  'python-six'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-anthropic'
  'python-freezegun'
  'python-google-genai'
  'python-openai'
  'python-parameterized'
  'python-pydantic'
  'python-pytest-asyncio'
  'python-pytest-timeout'
)
optdepends=(
  'python-anthropic: Anthropic support for LLM Observability'
  'python-google-genai: Google Gemini SDK support'
  'python-langchain: LLM observability callback handler'
  'python-openai: OpenAI SDK support'
)
source=("$_name-$pkgver.tar.gz::https://github.com/PostHog/posthog-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6fa2985d5059e6d386e1dc3fc987e2d1954ae224ef086d76a982d6937babd6f5')

prepare() {
  cd "$_name-$pkgver"

  # Drop python-mock checkdepends
  # https://archlinux.org/todo/drop-python-mock-checkdepends/
  sed -i 's/import mock/from unittest import mock/g' \
    posthog/test/test_{before_send,client,consumer,feature_flag_result,feature_flags,request}.py
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"

  # Disable tests requiring network access
  PYTHONPATH=. pytest -k 'not test_request'
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
