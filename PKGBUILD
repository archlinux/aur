# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
_pkgname=line_profiler
pkgver=4.2.0
pkgrel=1
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('x86_64')
license=(BSD-3-Clause)
depends=(ipython python)
makedepends=(cython python-build python-installer python-setuptools python-wheel)
checkdepends=('python-pytest' 'python-pytest-cov' 'python-ubelt')
optdepends=(python-rich)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pyutils/line_profiler/archive/v$pkgver.tar.gz")

sha256sums=('50e84e3abed7e845a77641fc7751688f6eb23b11c93f1715c56afd10eb187602')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation 
}

check() {
  mkdir -p test_dir
  python -m installer --destdir=test_dir "${srcdir}/$_pkgname-${pkgver}"/dist/*.whl
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="${srcdir}/test_dir/$_site_packages"
  export PATH="${srcdir}/test_dir/usr/bin:$PATH"
  echo $PYTHONPATH
  pytest "$_pkgname-${pkgver}/tests"
}

package() {
  cd "line_profiler-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
