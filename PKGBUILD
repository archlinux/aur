# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Fabio Volpe <volpefabio@gmail.com>

pkgname=python2-sphinx
pkgver=1.8.5
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
sha256sums=('c7658aab75c920288a8cf6f09f244c6cfdae30d82d803ac1634d9f223a80ca08'
            'SKIP'
            '089b458d15c0ed3967db29b6244599941a1a124b78826af941801bc86002050c')
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
