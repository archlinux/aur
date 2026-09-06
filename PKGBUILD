# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation-litellm
pkgname=python-$_name
pkgver=0.1.41
pkgrel=1
pkgdesc="OpenInference liteLLM Instrumentation."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/${pkgname/-//instrumentation/}"
license=('Apache-2.0')
depends=('python' 'python-opentelemetry-api' 'python-opentelemetry-sdk' 'python-opentelemetry-instrumentation' 'python-openinference-instrumentation' 'python-openinference-semantic-conventions' 'python-wrapt' 'python-setuptools')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-litellm' 'python-fastapi' 'python-orjson' 'python-opentelemetry-sdk' 'python-opentelemetry-instrumentation-httpx' 'python-pytest-recording' 'python-tenacity')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz"
        "fix-duplicated-thinking-text.patch")
sha256sums=('8357307f9a91fe92c468b6d0da2d7ed69cacf7cc0fbc4fe3359c2a905ec75ea2'
            '40007b9e2e2557deae751e058df6d0a289aea0721eca29e64f97318beb635474')

prepare() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//instrumentation/}
  patch -Np1 -i "$srcdir"/fix-duplicated-thinking-text.patch
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
