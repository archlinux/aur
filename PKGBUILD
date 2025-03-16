# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Clint Valentine <valentine.clint@gmail.com>
pkgname=python-pybedtools
_base=${pkgname#python-}
pkgver=0.12.0
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
sha512sums=('1789415c32e80350aa71b7cadde27b50df27a45e7bdf510822ceb667124db759134c222848f4b7bfea4389d77fe25ba111057c2307e6c95293e13d820078459d')

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
