# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild {at} gadz {dot} org>

pkgname=python-sklearn-pandas
pkgver=2.2.0
pkgrel=4
pkgdesc='Pandas integration with scikit-learn'
arch=(any)
url='https://github.com/scikit-learn-contrib/sklearn-pandas'
license=(custom:zlib/bsd)
depends=('python' 'python-scikit-learn' 'python-scipy' 'python-pandas' 'python-numpy')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-wheel')
checkdepends=(python-pytest python-joblib)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('290c587a1d6a74ebf2046b7753143cfedfe498fdb5b8b7318aee96fc98b20c12410bf7f03feb7a86fa5351a0dd899f7dce44b13090f49755cf20c15fa14082aa')

prepare() {
  cd "${srcdir}/sklearn-pandas-${pkgver}"
  # Fix tests for python 3.11
  sed -i 's/sparse.csr/sparse._csr/' README.rst
  sed \
    -e 's/target_x0_0/target_0/' \
    -e 's/target_x0_3/target_3/' \
    -e 's/colA_a/colA_0/' \
    -e 's/colA_b/colA_1/' \
    -i tests/test_dataframe_mapper.py
}

build() {
  cd "${srcdir}/sklearn-pandas-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/sklearn-pandas-${pkgver}"
  export PYTHONPATH="$PWD"
  pytest -vv
}

package() {
  cd "${srcdir}/sklearn-pandas-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
