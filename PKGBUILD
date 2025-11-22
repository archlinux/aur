# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=slycot
pkgname=python-$_name
pkgver=0.6.1
pkgrel=2
pkgdesc="A wrapper for the SLICOT control and systems library."
arch=('any')
url="https://github.com/python-control/Slycot"
license=('GPL-2.0 AND BSD-3-Clause')
depends=('python' 'python-numpy' 'glibc' 'gcc-libs' 'blas' 'lapack' 'gcc-fortran')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-scikit-build' 'cmake' 'gcc' 'python-numpy')
checkdepends=('python-scipy' 'python-pytest')
provides=("$pkgname")
conflicts=("$pkgname")
options=(!strip)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0ef1c71a16d4703797fd3955b6908c7df0c0079a06940ade96ede28c7b5520b0')

build() {
  cd "$srcdir/$_name-$pkgver"
  export BLA_VENDOR=Generic
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local pytest_options=(
    -vv
    --pyargs $_name
  )
  cd "$srcdir"/$_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}"
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
