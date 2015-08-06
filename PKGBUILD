# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=netglub
pkgver=1.0
pkgrel=5
pkgdesc="The really open source information gathering tool"
arch=('any')
url=('http://www.netglub.org')
license=('GPL')
source=("http://redmine.lab.diateam.net/attachments/download/1/$pkgname-$pkgver.tar.gz")
depends=('mariadb' 'qt4' 'sqlitebrowser' 'gdb' 'graphviz' 'python2')
md5sums=('c91005ccbd1010b7883f07e2d0e08e0a')
options=('!strip')

prepare() {
  cd "$srcdir/netglub-$pkgver"
  sed -i 's,'"#include <getopt.h>"',&\n#include <unistd.h>,' src/main.cpp
  find slave/data/transforms -type f -exec sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|g' '{}' \;
}

build() {
  # _FORTIFY_SOURCE causes errors maybe.
  unset CPPFLAGS CFLAGS CXXFLAGS LDFLAGS
  
  # Build master.
  cd "$srcdir/netglub-$pkgver/master"
  qmake-qt4
  make

  # Build slave.
  cd "$srcdir/netglub-$pkgver/slave"
  qmake-qt4
  make

  # Build gui.
  cd "$srcdir/netglub-$pkgver/qng"
  qmake-qt4
  scrub=$(awk '/LIBS.+=/' Makefile)
  sed -i 's|'"$scrub"'|&-lz|' Makefile
  sed -i '/^INCPATH/s|=|= -I/usr/include/graphviz|' Makefile
  make
}

package() {
  cd "$srcdir/netglub-$pkgver"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/etc/init.d"
  install -dm755 "$pkgdir/etc/"rc{2,3,4,5}.d
  install -m755 qnb/bin/*/* "$pkgdir/usr/bin"
  sed -i "s|/usr/local|$pkgdir/usr|g" {master,slave}/tools/install.sh
  sed -i "s|/etc|$pkgdir/etc|g" {master,slave}/tools/install.sh
  cd master/tools
  ./install.sh
  cd ../../slave/tools
  ./install.sh
}
