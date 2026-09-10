# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=openinference-instrumentation-dspy
pkgname=python-$_name
pkgver=0.1.45
pkgrel=1
pkgdesc="OpenInference DSPy Instrumentation."
arch=('any')
_repo="https://github.com/Arize-ai/openinference"
url="$_repo/tree/main/${pkgname/-//instrumentation/}"
license=('Apache-2.0')
depends=('python' 'python-opentelemetry-api' 'python-opentelemetry-instrumentation' 'python-opentelemetry-semantic-conventions' 'python-openinference-instrumentation' 'python-openinference-semantic-conventions' 'python-wrapt' 'python-typing_extensions')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-dspy' 'python-opentelemetry-sdk' 'python-pytest-recording' 'python-litellm' 'python-urllib3' 'python-vcrpy')
optdepends=('python-dspy: instruments')
source=("$_repo/archive/refs/tags/$pkgname-v$pkgver.tar.gz")
sha256sums=('50709b44ea22b907a1026753ab7d361232d31ae88934fff9c372a0de12d08909')

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
