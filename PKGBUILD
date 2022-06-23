# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

_pkgname=ocropy
pkgname=${_pkgname}-git
pkgver=998.fe78a04
pkgrel=1
pkgdesc="Python-based OCR package using recurrent neural networks (formerly ocropus)"
arch=('any')
url="https://github.com/ocropus/${_pkgname}"
license=('APACHE')
depends=('python2-pillow' 'python2-scipy' 'python2-matplotlib'
         'imagemagick' 'opencv' 'python2-lxml')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/ocropus/${_pkgname}.git"
        "https://github.com/zuphilip/ocropy-models/raw/master/en-default.pyrnn.gz")
sha256sums=('SKIP'
            'b749ec701a53915183963c3814a288de7da5a38261bd9008e0ae0674c71cd1f7')

pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/${_pkgname}"
  cp "$srcdir/en-default.pyrnn.gz" models
}

build() {
  cd "$srcdir/${_pkgname}"

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
  cd "$srcdir/${_pkgname}"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
