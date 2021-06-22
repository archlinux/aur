# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ocropy
pkgver=1.3.3
pkgrel=2
pkgdesc="Python-based OCR package using recurrent neural networks (formerly ocropus)"
arch=('any')
url="https://github.com/ocropus/ocropy"
license=('APACHE')
depends=('python2-imaging' 'python2-scipy' 'python2-matplotlib' 'python2-pytables'
         'imagemagick' 'opencv' 'python2-lxml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ocropus/ocropy/archive/v${pkgver}.tar.gz"
        "https://github.com/zuphilip/ocropy-models/raw/master/en-default.pyrnn.gz")
sha256sums=('8582589e87dd453c736478713c2d740c8e3e4479e519d8f8e8f25288081eff5c'
            'b749ec701a53915183963c3814a288de7da5a38261bd9008e0ae0674c71cd1f7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cp "$srcdir/en-default.pyrnn.gz" models

  sed -i 's|tobytes|tostring|' ocrolib/common.py
  #sed -i 's|PIL\.Image\.fromstring|PIL\.Image\.frombytes|' ocrolib/common.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

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
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
