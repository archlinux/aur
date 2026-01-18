# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=fastuuid
pkgname=python-$_name
pkgver=0.14.0
pkgrel=1
pkgdesc="Python bindings to Rust's UUID library."
arch=(any)
url="https://github.com/fastuuid/fastuuid"
license=('BSD-3-Clause')
depends=('python' 'glibc' 'gcc-libs')
makedepends=('python-maturin' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-hypothesis' 'python-pytest' 'python-pytest-benchmark' 'python-pytest' 'python-uuid7')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('178947fc2f995b38497a74172adee64fdeb8b7ec18f2a5934d037641ba265d26')

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
