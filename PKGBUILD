# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ocropy-git
pkgver=737.8b88583
pkgrel=1
pkgdesc="Python-based OCR package using recurrent neural networks (formerly ocropus)"
arch=('any')
url="https://github.com/tmbdev/ocropy"
license=('APACHE')
depends=('python-imaging' 'python2-scipy' 'python2-matplotlib' 'python2-pytables'
         'imagemagick' 'opencv' 'python2-beautifulsoup4')
makedepends=('git')
provides=('ocropy')
conflicts=('ocropy')
source=('git+https://github.com/tmbdev/ocropy.git'
        "http://www.tmbdev.net/en-default.pyrnn.gz")
md5sums=('SKIP'
         'cedd140c7d7650e910f0550ad0f04727')

pkgver() {
  cd "$srcdir/ocropy"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/ocropy"
  cp "$srcdir/en-default.pyrnn.gz" models
}

build() {
  cd "$srcdir/ocropy"

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
  cd "$srcdir/ocropy"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
