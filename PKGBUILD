# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=hep_ml
pkgname="python-${_pkgname}"
_pkgver=0.6.0  # update with official release
if [[ "${_pkgver}" == "0.6.0" ]]; then
  pkgver=0.6.1
else
  pkgver="${_pkgver}"
fi
pkgrel=1
pkgdesc="Specific machine learning tools for purposes of high energy physics"
arch=('any')
url="https://arogozhnikov.github.io/hep_ml/"
license=('Apache')
makedepends=('python-setuptools')
checkdepends=(
  'python-nose'
  'python-numpy'
  'python-scikit-learn'
  'python-scipy'
  'python-six'
  'python-pandas'
  'python-theano'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/arogozhnikov/${_pkgname}/archive/v${_pkgver}.tar.gz"
    'doc.patch'
    'pandas_xi.patch'
    'pandas_xi_2.patch'
    'tests.patch'
    'sklearn_depr.patch'
    'version.patch'
)
sha256sums=('f6978506566c8212690c2ff3c0cb586d7839845037a091cb26a8eab1cd70117b'
            'f8e5d7840dfb154cd747342bcffa8be2fed6f1b4eacba16ff0b5bada53d8ef31'
            '596b74fffd803d0ad1057af70d163b5bdd2fc45b2bceccd69d503bf5daa47bc0'
            '2fdaf4fb5168588ef4b51139ab80e8fe286033a216e0e1342d4dc7a45f7b9c01'
            '567b023a061c466a360b8d47ff6bd47dced820a36e80b74112c185a194f5d4d8'
            '06e511c8f2fddea22b118c9373123b6e582000871f0cdc88c387de62ff657c7a'
            'f8bd54801771fe22789ad21e0c90e28c1393d3ba3c26e6e6dc92926260545d27')

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "  -> Applying patch $src..."
    patch -Np1 -i "../$src" -d "${srcdir}/${_pkgname}-${_pkgver}"
  done
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  nosetests tests
}

package_python-hep_ml() {
  depends=('python-numpy' 'python-scikit-learn' 'python-scipy' 'python-six' 'python-pandas' 'python-theano')
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
