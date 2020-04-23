# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: corubba <corubba at gmx dot de>
# Contributor: Jakub Kozisek <nodevel at gmail dot com>

pkgname=puddletag-qt5-git
pkgver=r881.aab842a
pkgrel=2
pkgdesc="An audio tag editor for GNU/Linux, Qt5 version"
url="https://docs.puddletag.net/"
license=('GPL3')
arch=('any')
depends=('python2' 'python2-mutagen' 'python2-pyqt5' 
	 'python2-pyparsing' 'python2-configobj' 'python2-musicbrainz2' 
	 'qt5-svg' 'python2-pillow')
makedepends=('git')
optdepends=('chromaprint: AcoustID support' 
	    'quodlibet: QuodLibet library support')
provides=('puddletag')
conflicts=('puddletag')
source=("$pkgname::git+https://github.com/keithgg/puddletag#branch=pyqt5")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname/source"
  find ./ -type f -exec grep -rl '^#!.*python$' {} \; | xargs -L1 sed -i 's|^#!.*python$|#!/usr/bin/python2|'
}

build() {
  cd "$srcdir/$pkgname/source"
  python2 setup.py config
}

package() {
  cd "$srcdir/$pkgname/source"
  python2 setup.py install --root="$pkgdir" --optimize=1 || return 1
}
