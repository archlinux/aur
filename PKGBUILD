# Maintainer: Rubin Simons <me@rubin55.org>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=jsonpath-python
pkgname=python-$_name
pkgver=1.1.6
pkgrel=3
pkgdesc="A more powerful JSONPath implementation in modern python."
arch=('any')
url="https://github.com/sean2077/jsonpath-python"
license=('MIT')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'git')
checkdepends=('python-pytest'
              'python-pytest-benchmark')
source=("$_name::git+$url.git#tag=$pkgver")
sha256sums=('9e0ae4577526317249c34f7ed9ac27a710c4bdf927798e249bcba3e2ce6e9d04')

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
}

check(){
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
