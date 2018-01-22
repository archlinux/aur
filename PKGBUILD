# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=PyVCF
pkgbase='python-pyvcf'
pkgname=('python-pyvcf' 'python2-pyvcf')
pkgver=0.6.8
pkgrel=2
pkgdesc="A Variant Call Format reader for Python"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('custom:population-genetics-technologies')
makedepends=(
  'python' 'python-setuptools' 'cython'
  'python2' 'python2-setuptools' 'cython2')
options=(!emptydirs)
source=(
  https://raw.githubusercontent.com/jamescasbon/PyVCF/476169cd457ba0caa6b998b301a4d91e975251d9/LICENSE
  "${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/20/b6/36bfb1760f6983788d916096193fc14c83cce512c7787c93380e09458c09/PyVCF-0.6.8.tar.gz
)
sha256sums=(
  'f4a2bc89af6b660958705e9f5e47ed5ebf31690101b121b9016b807ee1967e6a'
  'e9d872513d179d229ab61da47a33f42726e9613784d1cb2bac3f8e2642f6f9d9'
)

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-pyvcf() {
  depends=('python2')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build

  mv "${pkgdir}"/usr/bin/vcf_melt "${pkgdir}"/usr/bin/vcf_melt2
  for script in "${pkgdir}"/usr/bin/*.py; do
    mv "${script}" "${pkgdir}"/usr/bin/$(basename "${script%.py}2.py")
  done
}

package_python-pyvcf() {
  depends=('python')

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
}
