# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=python38-pytables
pkgver=3.7.0
pkgrel=3
pkgdesc="A package for managing hierarchical datasets and designed to efficiently and easily cope with extremely large amounts of data"
arch=(x86_64)
url="https://www.pytables.org"
license=('BSD')
depends=(blosc lzo hdf5 python38-numexpr)
makedepends=(python38-setuptools cython)
source=(https://github.com/PyTables/PyTables/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('41065fc11b958dde09bd5b9c069d88e40ca07ad10687dd597835fcc8199e81ea')

build() {
  cd PyTables-${pkgver}
  python3.8 setup.py build --blosc=/usr --lzo=/usr --hdf5=/usr --bzip2=/usr
}

check() {
  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  cd PyTables-${pkgver}/build/lib.linux-${CARCH}-${python_version}
  PYTHONPATH="." python3.8 -m tables.tests.test_all
}

package() {
  cd PyTables-${pkgver}
  python3.8 setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
