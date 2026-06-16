# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=slycot
pkgname=python-$_name
pkgver=0.7.0
pkgrel=1
pkgdesc="A wrapper for the SLICOT control and systems library."
arch=('any')
url="https://github.com/python-control/Slycot"
license=('GPL-2.0 AND BSD-3-Clause')
depends=('python' 'python-numpy' 'glibc' 'libgcc' 'blas' 'lapack' 'gcc-fortran')
makedepends=('python-scikit-build-core' 'python-numpy' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'gcc')
checkdepends=('python-scipy' 'python-pytest')
options=(!strip)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('41ba13991982b0304520bf5115491d63f644389552eea62fc2ecbd21ef661001')

build() {
  cd "$srcdir/$_name-$pkgver"
  export BLA_VENDOR=Generic
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}"
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
