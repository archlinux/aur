# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ocropy
pkgver=1.0
pkgrel=2
pkgdesc="Python-based OCR package using recurrent neural networks (formerly ocropus)"
arch=('any')
url="https://github.com/tmbdev/ocropy"
license=('APACHE')
depends=('python-imaging' 'python2-scipy' 'python2-matplotlib' 'python2-pytables'
         'imagemagick' 'opencv' 'python2-beautifulsoup4')
source=("https://github.com/tmbdev/ocropy/archive/v${pkgver}.tar.gz"
        "fixcast.patch::https://github.com/dblN/ocropy/commit/0e54bae2ef640a163c107a16b425dfd5ac698622.patch"
        "http://www.tmbdev.net/en-default.pyrnn.gz")
md5sums=('622636a7dde7c304ec719b65cf885a86'
         'bec6823d44722a839513d6527bdcfb7e'
         'cedd140c7d7650e910f0550ad0f04727')

prepare() {
  cd "$srcdir/ocropy-$pkgver"
  cp "$srcdir/en-default.pyrnn.gz" models

  sed -i 's|tostring|tobytes|' ocrolib/common.py
  sed -i 's|PIL\.Image\.fromstring|PIL\.Image\.frombytes|' ocrolib/common.py
  patch -Np1 < "$srcdir/fixcast.patch"
}

build() {
  cd "$srcdir/ocropy-$pkgver"

  # make sure python2 is always used
  find . -type f -name "*.py" -exec sed -i 's|^#!.*python$|&2|' '{}' ';'
  sed -i 's|^#!.*python$|&2|' ocropus-*
  # FIX LOADING OF MODELS
  sed -i 's|/usr/local|/usr|' ocrolib/common.py
  sed -i 's|/usr/local|/usr|' ocrolib/default.py
  # build
  python2 setup.py build
}

package() {
  cd "$srcdir/ocropy-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
