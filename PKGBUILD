# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: helq <linuxero789@gmail.com>
# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>
# Contributor: DobleD <dobled@dobled.info>

pkgname=ninja-ide
pkgver=2.4
pkgrel=2
pkgdesc="Cross-platform IDE focused on Python application development"
arch=('any')
url="http://ninja-ide.org"
license=('GPL3')
depends=('python-pyqt5' 'qt5-declarative')
makedepends=('python-setuptools')
source=(https://github.com/ninja-ide/ninja-ide/archive/v$pkgver.zip
        ninja-ide.desktop
        remove-qtwebkit.patch)
sha256sums=('aca3bc5991d97f4bff04f2ba4775d053e9127fed56927dcc949ea3d309bb7cf3'
            '9da43b0b44cdeebe8ad14b2d2fa508156cebe5359a66b26482c28597835e46ab'
            'ba0d32eb194bcdfebf96e2f8a276c19f8aeadd28961fc135504d8715db5ee52c')

prepare() {
  cd $pkgname-$pkgver

  # Remove qtwebkit dependency
  # patch -Np1 -i ../remove-qtwebkit.patch

  # This was missed in the v2.4 backport
  sed -r "s/(print) ('.+')$/\1\(\2\)/" \
      -i "ninja_tests/core/examples/file_for_tests.py"

  # Work around not being prepared for python 3.8
  sed -e "s/_ast.Num/_ast.Constant/" \
      -e "/_ast.Str/ s/^/#/" \
      -i ninja_ide/tools/introspection.py  \
         ninja_ide/tools/completion/analyzer.py
}

package() {
  cd $pkgname-$pkgver

  python setup.py install --root="$pkgdir" -O1

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ninja_ide/img/icon.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
