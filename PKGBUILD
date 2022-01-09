# Maintainer: Clint Valentine <valentine.clint@gmail.com>
_base=pybedtools
pkgname=python-${_base}-git
pkgver=0.8.0.r138.gffe0d4b
pkgrel=1
pkgdesc="Wrapper around BEDTools for bioinformatics work"
arch=('any')
url="https://github.com/daler/${_base}"
license=(GPL2)
depends=(bedtools python-pandas python-pysam)
makedepends=(cython git)
optdepends=(
  'htslib: for working with SAM/BAM/CRAM files'
  'python-matplotlib: for plotting genomic intervals'
  'ucsc-kent-genome-tools: for bedgraph to bigwig conversions')
provides=('python-pyvcf')
conflicts=('python-pyvcf')
# options=(!emptydirs)
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
  cd "${_base}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed s'/v//'
}

build() {
  cd "${_base}"
  python setup.py build
}

package() {
  cd "${_base}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
