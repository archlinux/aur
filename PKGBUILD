# Maintainer: envolution
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# ci|forcedep=python-protobuf|
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-posthog
_name=posthog-python
pkgver=6.7.9
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
  'python-typing_extensions'
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
  'python-pytest'
)
optdepends=(
  'python-anthropic: Anthropic support for LLM Observability'
  'python-google-genai: Google Gemini SDK support'
  'python-langchain: LLM observability callback handler'
  'python-openai: OpenAI SDK support'
)
source=("$_name-$pkgver.tar.gz::https://github.com/PostHog/posthog-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c73dc3e65acd5639ac86f98a748566159d0cab0ec46594d9f755934ac0178b8e')

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

  # Disable tests requiring network access and API key
  PYTHONPATH=. pytest -k 'not test_feature_flags or test_request'
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set ts=2 sw=2 et:
