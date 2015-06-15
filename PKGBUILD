#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Techlive Zheng <techlivezheng [at] gmail [dot] com>

pkgname=airgraph-ng-svn
pkgdesc="Graphing tool for the aircrack-ng suite"
pkgver=2112
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.aircrack-ng.org"
license=('GPLv2')
depends=('python2' 'graphviz')
optdepends=("psyco: JIT compiler for python")
makedepends=('subversion')
provides=(airgraph)
conflicts=('airgraph-ng'
	   'aircrack-ng-scripts')
source=( svn://trac.aircrack-ng.org/svn/trunk/scripts/airgraph-ng/)
sha512sums=('SKIP')

_svnmod=trunk

pkgver() {
  cd trunk/
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
 
  msg "Starting make..."

  if [ -d ${_svnmod}-build/ ]; then
    msg "Build exists, cleaning it up... "
    rm -rf ${_svnmod}-build
  fi

  msg "Creating build folder... "
  svn export ${_svnmod} ${_svnmod}-build
  
  grep -rl python ${_svnmod}-build | xargs sed -i 's|python|python2|g'
}

package() {
  cd ${srcdir}

  install -D -m755 ${_svnmod}-build/dump-join		${pkgdir}/usr/bin/dump-join
  install -D -m755 ${_svnmod}-build/airgraph-ng		${pkgdir}/usr/bin/airgraph-ng
  install -d ${pkgdir}/usr/lib/airgraph-ng
  install -m644 ${_svnmod}-build/graphviz/*		${pkgdir}/usr/lib/airgraph-ng/
  install -D -m644 ${_svnmod}-build/man/dump-join.1	${pkgdir}/usr/share/man/man1/dump-join.1
  install -D -m644 ${_svnmod}-build/man/airgraph-ng.1	${pkgdir}/usr/share/man/man1/airgraph-ng.1
  install -D -m644 ${_svnmod}-build/README		${pkgdir}/usr/share/doc/airgraph-ng/README
  install -D -m644 ${_svnmod}-build/setup.py		${pkgdir}/usr/lib/airgraph-ng/setup.py
  install -D -m644 ${_svnmod}-build/test/test-1.txt	${pkgdir}/usr/include/airgraph-ng/test-1.txt
  #Remove build directory
  rm -rf ${_svnmod}-build
}