# Maintainer:
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=jarowinkler
pkgname=python-$_name
pkgver=1.2.1
pkgrel=1
pkgdesc='A library for fast approximate string matching using Jaro and Jaro-Winkler similarity'
arch=(x86_64)
url='https://github.com/maxbachmann/JaroWinkler'
license=(MIT)
depends=(python)
#makedepends=(jarowinkler-cpp python-rapidfuzz-capi python-scikit-build)
makedepends=(python-build python-installer python-setuptools python-scikit-build python-rapidfuzz-capi ninja)
checkdepends=(python-hypothesis python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('206364a885ce296f7f79c669734317f2741f6bbd964907e49e3b9ea0e9de5029')

build() {
  cd $_name-$pkgver
  JAROWINKLER_BUILD_EXTENSION=1 \
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
