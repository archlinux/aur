# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name=pybedtools
pkgbase='python-pybedtools-git'
pkgname=('python-pybedtools-git' 'python2-pybedtools-git')
pkgver=0.7.10.r25.g9ab3ff6
pkgrel=1
pkgdesc="Python wrapper for the bioinformatics genomic arithmetic tool bedtools"
arch=('any')
url="https://pypi.python.org/pypi/pybedtools"
license=('GPL2')
provides=('python-pybedtools')
conflicts=('python-pybedtools')
makedepends=(
  'python' 'python-setuptools' 'cython'
  'python2' 'python2-setuptools' 'cython2')
options=(!emptydirs)
source=("${_name}"-"${pkgver}"::git+https://github.com/daler/"${_name}".git)
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"-"${pkgver}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed s'/v//'
}

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

package_python2-pybedtools-git() {
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
    mv "${script}" "${pkgdir}"/usr/bin/$(basename "${script%.*py}")2.py
  done
}

package_python-pybedtools-git() {
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
