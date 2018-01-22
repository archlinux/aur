# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=PyVCF
pkgbase='python-pyvcf-git'
pkgname=('python-pyvcf-git' 'python2-pyvcf-git')
pkgver=v0.5.0.r266.g476169c
pkgrel=2
pkgdesc="A Variant Call Format reader for Python"
arch=('any')
url=https://pypi.python.org/pypi/"${_name}"
license=('custom:population-genetics-technologies')
makedepends=(
  'python' 'python-setuptools' 'cython'
  'python2' 'python2-setuptools' 'cython2')
options=(!emptydirs)
source=("${_name}"-"${pkgver}"::git+https://github.com/jamescasbon/"${_name}".git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-pyvcf-git() {
  depends=('python2')
  provides=('python2-pyvcf')
  conflicts=('python2-pyvcf')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  mv "${pkgdir}"/usr/bin/vcf_melt "${pkgdir}"/usr/bin/vcf_melt2
  for script in "${pkgdir}"/usr/bin/*.py; do
    mv "${script}" "${pkgdir}"/usr/bin/$(basename "${script%.py}2.py")
  done
}

package_python-pyvcf-git() {
  depends=('python')
  provides=('python-pyvcf')
  conflicts=('python-pyvcf')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
