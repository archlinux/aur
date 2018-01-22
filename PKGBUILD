# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pybedtools
pkgbase='python-pybedtools'
pkgname=('python-pybedtools' 'python2-pybedtools')
pkgver=0.7.10
pkgrel=3
pkgdesc="Python wrapper for the bioinformatics genomic arithmetic tool bedtools"
arch=('any')
url="https://pypi.python.org/pypi/pybedtools"
license=('GPL2')
makedepends=(
  'python' 'python-setuptools' 'cython'
  'python2' 'python2-setuptools' 'cython2')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/09/57/e7668e8644c60413be05b8cc9c23aaea3a0717b4025843d8c26b7c4822af/pybedtools-0.7.10.tar.gz)
sha256sums=('518a2311bd33f29cf2ee8fc1a028dda8c8e380c9fc83fcb0fbaa206933174b50')

prepare() {
  cp -a "${_name}"-"${pkgver}"{,-py2}
}

package() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

build(){
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build

  cd "${srcdir}"/"${_name}"-"${pkgver}"-py2
  python2 setup.py build
}

package_python2-pybedtools() {
  depends=(
    'bedtools'
    'python2'
    'python2-numpy'
    'python2-pandas'
    'python2-pysam'
    'python2-six')
  optdepends=(
    'htslib: for working with SAM/BAM/CRAM files'
    'python2-matplotlib: for plotting genomic intervals'
    'ucsc-kent-genome-tools: for bedgraph to bigwig conversions')

  cd "${_name}"-"${pkgver}"-py2
  python2 setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt

  sed 's/python/python2/g' "${pkgdir}"/usr/bin/pybedtools
  mv "${pkgdir}"/usr/bin/pybedtools "${pkgdir}"/usr/bin/pybedtools2

  for script in "${pkgdir}"/usr/bin/*.py;do
    mv "${pkgdir}"/usr/bin/"${script}" "${pkgdir}"/usr/bin/"${script%.*py}"2.py
  done
}

package_python-pybedtools() {
  depends=(
    'bedtools'
    'python'
    'python-numpy'
    'python-pandas'
    'python-pysam'
    'python-six')
  optdepends=(
    'htslib: for working with SAM/BAM/CRAM files'
    'python-matplotlib: for plotting genomic intervals'
    'ucsc-kent-genome-tools: for bedgraph to bigwig conversions')

  cd "${_name}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE.txt
}
