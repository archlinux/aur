# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation-litellm
pkgname=python-$_name
pkgver=0.1.57
pkgrel=1
pkgdesc="OpenInference liteLLM Instrumentation."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/python/instrumentation/$_name"
license=('Apache-2.0')
depends=('python'
         'python-opentelemetry-api'
         'python-opentelemetry-sdk'
         'python-opentelemetry-instrumentation'
         'python-openinference-instrumentation'
         'python-openinference-semantic-conventions'
         'python-wrapt'
         'python-setuptools')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-asyncio'
              'python-litellm'
              'python-fastapi'
              'python-orjson'
              'python-opentelemetry-sdk'
              'python-opentelemetry-instrumentation-httpx'
              'python-pytest-recording'
              'python-tenacity')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz"
        "fix-duplicated-thinking-text.patch"
        "litellm-1.101-streaming-cost.patch"
        "litellm-1.109-tests.patch")
sha256sums=('23b5a35744b81a11a69a55ab8fe9893b388732213c103c196cd4e2885102593e'
            '40007b9e2e2557deae751e058df6d0a289aea0721eca29e64f97318beb635474'
            '870faeb49e5a54bf88e1001ec7d77922fcc019369bc4cc14f1efd84a192d5613'
            '74439d308362bc395b43d8829024563747ac727c0bc2603ac47d58d908beb3a3')

prepare() {
  cd "${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}"
  patch -Np1 -i "$srcdir"/fix-duplicated-thinking-text.patch
  patch -Np1 -i "$srcdir"/litellm-1.101-streaming-cost.patch
  # litellm 1.109 dropped dall-e-2 and added close()/aclose() to the Responses stream iterators
  patch -Np1 -i "$srcdir"/litellm-1.109-tests.patch
}

build() {
  cd "${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
