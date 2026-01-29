# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ormsgpack
pkgname=python-$_name
pkgver=1.12.2
pkgrel=1
pkgdesc="Fast, correct Python msgpack library supporting dataclasses, datetimes, and numpy."
arch=('any')
url='https://github.com/ormsgpack/ormsgpack'
license=('Apache-2.0 OR MIT')
depends=('python' 'glibc' 'gcc-libs')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-msgpack' 'python-numpy' 'python-pendulum' 'python-pydantic' 'python-pytest' 'python-dateutil' 'python-pytz' 'python-tzdata')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('58c8803dd833f979645976cf36a521a1036b66dde655abfa163129e9ebbe997f')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
