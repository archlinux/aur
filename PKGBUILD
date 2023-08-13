# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybedtools
_base=${pkgname#python-}
pkgver=0.9.1
pkgrel=1
pkgdesc="python wrapper for BEDTools bioinformatics suite"
arch=('x86_64')
url="https://github.com/daler/pybedtools"
license=(GPL2)
depends=('python' 'bedtools' 'python-numpy' 'python-pandas' 'python-pysam' 'python-six' 'glibc' 'gcc-libs' 'zlib' 'python-yaml')
makedepends=('cython' 'python-setuptools' 'python-pytest' 'python-pyaml' 'python-yaml' 'python-numpydoc' 'python-sphinx' 'python-build'
             'python-installer'
             'python-wheel')
optdepends=(
  'htslib: for working with SAM/BAM/CRAM files'
  'python-matplotlib: for plotting genomic intervals'
  'ucsc-genome-browser: for bedgraph to bigwig conversions')
provides=('python-pyvcf')
conflicts=('python-pyvcf')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a4a72326b51de51a42205f8c7113e48a769fd2981bf7866f1b353b374eebac6b2aa32971c575cbe18ef0b8e1d680d1dac7ea0ec49c9a7b0deb34befb184a1a89')

prepare() {
  cd "${_base}-${pkgver}"
  # delete the cython-generated extensions to force rebuild against python 3.11
  rm pybedtools/cbedtools.cpp
  rm pybedtools/featurefuncs.cpp
}

build() {
  cd "${_base}-${pkgver}"
   python -m build --wheel --no-isolation
   #python setup.py build_ext -i -f
   #python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  #export PYTHONHASHSEED=0
  #PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  #python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
