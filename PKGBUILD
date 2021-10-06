# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
# Contributor: Felix Golatofski <xdfr.de>

pkgname=python2-sphinx
pkgver=1.8.6
pkgrel=1
pkgdesc='Python2 documentation generator'
arch=('any')
url=http://www.sphinx-doc.org/
license=('BSD')
depends=('python2-babel'
         'python2-docutils'
         'python2-imagesize'
         'python2-jinja'
         'python2-pygments'
         'python2-requests'
         'python2-setuptools'
         'python2-snowballstemmer'
         'python2-sphinx-alabaster-theme'
         'python2-sphinxcontrib-'{{apple,dev,html}help,jsmath,qthelp,serializinghtml})
checkdepends=('cython'
              'imagemagick' 'librsvg'
              'python2-html5lib'
              'python2-pytest'
              'texlive-fontsextra' 'texlive-latexextra')
optdepends=('imagemagick: for ext.imgconverter'
            'texlive-latexextra: for generation of PDF documentation')
source=("https://pypi.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz"{,.asc}
        "python2-lexer.patch")
sha512sums=('adbd7c2b849c5768d1092e4871cfa9c6aa564edfb4abde0a11ba265bf1445950aa14ad2b072a29b4e40fc3a68fcf6697aca1465060e68f31dfa94ec8e6e0629a'
            'SKIP'
            'c6de8f8f937f8213ff1f3a88c9af64f73750affbe3deef007cd846ad8b7c6c7a2003ee403452350789d9239447137fbc5094a2917566f317329d359043b51a51')
validpgpkeys=('8A11B79A5D0D749A66F0A030102C2C17498D6B9E'  # Takeshi KOMIYA <i.tkomiya@gmail.com>
              'E9BEABB07E7B9CC3F56E62C91425F8CE5EBA0E07') # Takayuki Shimizukawa <shimizukawa@gmail.com>

prepare() {
  cd Sphinx-$pkgver
  patch -p1 -i ../python2-lexer.patch # Use proper python lexer with new pygments (NixOS)

  # change python2 interpreter
  find . -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
  # change sphinx-binaries name in source code
  find . -type f -name '*.py' -exec \
    sed -ri 's,(sphinx-(:?build|apidoc|autogen|quickstart)),\12,' {} \;
}

build() {
  cd Sphinx-$pkgver
  make PYTHON=python2 build
}

# check() {
#   cd Sphinx-$pkgver
#   LC_ALL="en_US.UTF-8" make PYTHON=python2 test
# }

package() {
  cd Sphinx-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
