# $Id$
# Maintainer: Jens Staal <staal1978@gmail.com>
# Adapter from "uniconvertor" package
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=uniconvertor-git
pkgver=0.r350.g58bfaf5
pkgrel=1
pkgdesc="A universal vector graphics translator using sK1 engine."
arch=('i686' 'x86_64')
url="http://sk1project.org/modules.php?name=Products&product=uniconvertor"
license=('GPL')
depends=('python2' 'python2-pillow' 'python2-reportlab' 'sk1libs')
makedepends=('gcc')
source=('git://github.com/sk1project/uniconvertor.git')
md5sums=('SKIP')

provides=('uniconvertor')
conflicts=('uniconvertor')
replaces=('uniconvertor')

pkgver() {
  cd "$srcdir/uniconvertor"

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

build() {
  cd "$srcdir/uniconvertor"

  # python2 fix
  sed -i 's_#! /usr/bin/python_#! /usr/bin/python2_' src/uniconvertor/__init__.py

  python2 setup.py build
}

package() {
  cd "$srcdir/uniconvertor"
  python2 setup.py install --root="$pkgdir"
} 
