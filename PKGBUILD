# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation
pkgname=python-$_name
pkgver=0.1.67
pkgrel=1
pkgdesc="OpenInference instrumentation utilities."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/${pkgname/-//}"
license=('Apache-2.0')
depends=('python'
         'python-opentelemetry-api'
         'python-opentelemetry-sdk'
         'python-openinference-semantic-conventions'
         'python-wrapt')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-wheel')
checkdepends=('python-pytest'
              'python-jsonschema'
              'python-openai'
              'python-pydantic'
              'python-pytest-asyncio'
              'python-pytest-recording')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('5167e3aa37eb5e6f89e0f973ddeacfa0ef03cc9d13ecd1759fec5c488d0b2334')

build() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/${pkgname/-//}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
