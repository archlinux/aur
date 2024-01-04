# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
_pkgname=line_profiler
pkgver=4.1.2
pkgrel=1
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('x86_64')
license=('BSD')
depends=('python-setuptools' 'ipython')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-ubelt')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pyutils/line_profiler/archive/v$pkgver.tar.gz")

sha256sums=('a1f3458c1dd1bf4b2d1d2657b78225f4e4e9046a1841f18cf528f01ebd3d5f43')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation 
}

check() {
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "$_pkgname-${pkgver}"
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="${srcdir}/$_pkgname-${pkgver}/test_dir/$_site_packages"
  export PATH="${srcdir}/$_pkgname-${pkgver}/test_dir/usr/bin:$PATH"
  ./run_tests.py
}

package() {
  cd "line_profiler-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
