# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation-dspy
pkgname=python-$_name
pkgver=0.1.43
pkgrel=1
pkgdesc="OpenInference DSPy Instrumentation."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/python/instrumentation/$_name"
license=('Apache-2.0')
depends=('python' 'python-opentelemetry-api' 'python-opentelemetry-instrumentation' 'python-opentelemetry-semantic-conventions' 'python-openinference-instrumentation' 'python-openinference-semantic-conventions' 'python-wrapt' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-dspy' 'python-opentelemetry-sdk' 'python-pytest-recording' 'python-litellm' 'python-urllib3' 'python-vcrpy')
optdepends=('python-dspy: instruments')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('5cd51309ca0d81ec4f2c7bc6ad6e6702cd476c13b9347265de3c7fe605b26b3b')

build() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/python/instrumentation/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/python/instrumentation/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name%%-*}-$pkgname-v$pkgver/python/instrumentation/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
