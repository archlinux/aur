# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Andrew Conkling <andrewski@fr.st>

pkgname=gourmet
pkgver=0.17.4
pkgrel=8
pkgdesc="A simple but powerful recipe-managing application"
arch=('any')
url="https://thinkle.github.io/gourmet/"
license=('GPL')
depends=('pygtk' 'python2-elib-intl' 'python2-pillow' 'python2-sqlalchemy')
makedepends=('python2-distutils-extra')
optdepends=('ipython2: Python Shell plugin'
            'python2-pyrtf: RTF support'
            'python2-beautifulsoup4: Webpage import plugin'
            'python2-gtkspell: Spell Checking plugin'
            'python2-poppler: Printing and PDF Export plugin'
            'python2-reportlab: Printing and PDF Export plugin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thinkle/$pkgname/archive/$pkgver.tar.gz"
        "gourmet-pillow.patch"
        "bs4-port.patch"
        "0001-Fix-AppStream-metadata-validation.patch")
sha256sums=('13edd3b9c3a3507d20b80cff0f88183ac7979b720e7577290815ffacca097fe3'
            '3680663b09fc61e5797990c378597eeb5db6915b4db987ac2d1a55c7f2636047'
            '815b0fb735d6b581fba0cec713a9ad963f842c969db9fef3e3b0d66ef11bd3b0'
            '010ba6616751a87854d0fefdf6f26cfa6b6d20ea908b46250bbfc6bea04bab35')

prepare() {
  cd $pkgname-$pkgver

  # python2 fix
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # Fix for pillow 3
  # https://github.com/thinkle/gourmet/commit/4d88788a
  patch -Np1 -i ../gourmet-pillow.patch

  # Port to Beautiful Soup 4
  # https://github.com/thinkle/gourmet/commit/fdd0f10a
  patch -Np1 -i ../bs4-port.patch

  # Fix AppStream metadata validation
  # https://github.com/thinkle/gourmet/pull/928
  patch -Np1 -i ../0001-Fix-AppStream-metadata-validation.patch
}

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
