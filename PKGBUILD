# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation-litellm
pkgname=python-$_name
pkgver=0.1.49
pkgrel=1
pkgdesc="OpenInference liteLLM Instrumentation."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/${pkgname/-//instrumentation/}"
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
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest-asyncio'
              'python-litellm'
              'python-fastapi'
              'python-orjson'
              'python-opentelemetry-sdk'
              'python-opentelemetry-instrumentation-httpx'
              'python-pytest-recording'
              'python-tenacity')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz"
        "fix-duplicated-thinking-text.patch"
        "litellm-1.101-streaming-cost.patch")
sha256sums=('bd43ef95aa41805e81de91f1f62665460e9b2670e5b2d2a20b301f87da17034c'
            '40007b9e2e2557deae751e058df6d0a289aea0721eca29e64f97318beb635474'
            '870faeb49e5a54bf88e1001ec7d77922fcc019369bc4cc14f1efd84a192d5613')

prepare() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}
  patch -Np1 -i "$srcdir"/fix-duplicated-thinking-text.patch
  patch -Np1 -i "$srcdir"/litellm-1.101-streaming-cost.patch
}

build() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
