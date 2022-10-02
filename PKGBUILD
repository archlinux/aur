# Maintainer:
# Contributor: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_name=jarowinkler
pkgname=python-$_name
pkgver=1.2.3
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
sha256sums=('af28ea284cfbd1b21b29ff94b759f20e94e4f7c06f424b0b4702e701c2a21668')

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
