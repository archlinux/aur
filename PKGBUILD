# Maintainer: Guillaume Horel <guillaume dot horel at gmail dot com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_pyname=scikit_sparse
pkgname=python-scikit-sparse
pkgver=0.4.15
pkgrel=1
pkgdesc='Scikit sparse matrix package'
url="https://pypi.python.org/pypi/$_pyname/"
checkdepends=(python-pytest)
depends=(python-scipy suitesparse)
makedepends=(cython python-build python-installer python-setuptools python-wheel)
license=('BSD-2-Clause')
arch=('x86_64')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/well1033.mtx.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/well1033_rhs1.mtx.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/illc1033.mtx.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/illc1033_rhs1.mtx.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/well1850.mtx.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/well1850_rhs1.mtx.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/illc1850.mtx.gz"
        "https://math.nist.gov/pub/MatrixMarket2/Harwell-Boeing/lsq/illc1850_rhs1.mtx.gz"
)
sha256sums=('a0b1ef1bbe9e28e5c6d2838c63c62e094a8098d11a736771edac55ccc5f9eabe'
            '5489ac8433eb94f98e9f452c0501eb62df545070749e45636cdaf701df5f3444'
            '53ef7635b9223be738d1aeddfc7791a5e4732fba14972ca93a4f74a7c8e73f2f'
            '198613a53f044d83c996b5d81d12ad8aa7625e6e6e58d96c42d25a533bf48e61'
            '2dc10862b43fece1e6b05e57a3f69765f4a11d281da262e72db11f4789f29669'
            '8eb8f4a19e82c60f03b487411f566aeeb2772a57bdc7d45c53ce5ba62b3f1221'
            '96ca30fdabd5e40d348f580962d0ede6f2758e8088cf03819cb64f4efc774624'
            'c05ad6c2fbbc5e4307d2ae4cdd94131a7e4f4689389117cf3c70571228b91ea3'
            '4807ab0f4f5f0f254feaf227f63c80574b7713f2f68cde092338b6114911054d')

build() {
  cd $_pyname-$pkgver
  python -m build -wn
}

package() {
  cd $_pyname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check() {
  cd "$_pyname-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  mkdir tests/test_data
  for f in well1033 illc1033 well1850 illc1850
  do
    cp "$srcdir/$f"{,_rhs1}.mtx.gz tests/test_data
  done
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" pytest tests
}
