# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-posthog
_name=posthog-python
pkgver=3.15.1
pkgrel=1
pkgdesc="Integrate PostHog into any python application."
arch=('any')
url="https://posthog.com/docs/libraries/python"
license=('MIT')
depends=(
  'python-backoff'
  'python-dateutil'
  'python-monotonic'
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
  'python-openai'
  'python-pytest-asyncio'
  'python-pytest-timeout'
)
optdepends=(
  'python-anthropic: Anthropic support for LLM Observability'
  'python-django: Django Sentry Integration'
  'python-langchain: LLM observability callback handler'
  'python-openai: OpenAI SDK support'
  'python-sentry_sdk: Django Sentry Integration'
)
source=("$_name-$pkgver.tar.gz::https://github.com/PostHog/posthog-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a15bef7f12d5bf83ecd440a2dac452888a14d975e763f170f665d5bd79e3d8a6')

prepare() {
  cd "$_name-$pkgver"

  # Drop python-mock checkdepends
  # https://archlinux.org/todo/drop-python-mock-checkdepends/
  sed -i 's/import mock/from unittest import mock/g' \
    posthog/test/test_{client,consumer,feature_flags,request}.py
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
