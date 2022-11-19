# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python38-lxml
pkgname=('python38-lxml' 'python38-lxml-docs')
pkgver=4.9.1
pkgrel=1
pkgdesc="Python3 binding for the libxml2 and libxslt libraries"
arch=('x86_64')
license=('BSD' 'custom')
url="https://lxml.de/"
depends=('python38' 'libxslt')
optdepends=('python38-beautifulsoup4: support for beautifulsoup parser to parse not well formed HTML'
            'python38-cssselect: support for cssselect'
            'python38-html5lib: support for html5lib parser'
            'python38-lxml-docs: offline docs')
makedepends=('python38-setuptools' 'python38-pygments' 'python38-sphinx' 'python38-sphinx_rtd_theme'
             'cython')
checkdepends=('python38-cssselect' 'python38-html5lib' 'python38-beautifulsoup4')
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('f52d54908f92997f610638a9a3054cb73723ae81a5ad9e77918b0603ec7441b0e7d2143f8a8ac66c05cd6a0b3b298d348397b7e2df19f83c21e336514c47d910')

prepare() {
  mv lxml-lxml-$pkgver lxml-$pkgver

  # Setting LC_CTYPE to workaround encoding issue
  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd lxml-$pkgver
  python3.8 setup.py build
  make html
}

check() {
  # TODO: Find a sane way to skip inplace build

  cd lxml-$pkgver
  make PYTHON=python3.8 test
}

package_python38-lxml() {
  cd lxml-$pkgver
  python3.8 setup.py install --root="$pkgdir" --skip-build --optimize=1

  install -Dm644 LICENSES.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/elementtree.txt
}

package_python38-lxml-docs() {
  pkgdesc="Python binding for the libxml2 and libxslt libraries (docs)"
  depends=()
  options=('docs')

  cd lxml-$pkgver
  install -d "$pkgdir"/usr/share/doc/$pkgbase
  cp -r doc/html "$pkgdir"/usr/share/doc/$pkgbase

  install -Dm644 LICENSES.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/elementtree.txt
}
