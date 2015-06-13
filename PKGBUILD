# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Daniel YC Lin <dlin.tw at gmail>
pkgname=fix8-git
pkgver=1.3.3
pkgrel=1
pkgdesc="Open Source C++ FIX Engine"
arch=('x86' 'x86_64')
url="http://www.fix8.org"
license=(LGPL3)
depends=('poco' 'gperftools' 'intel-tbb')
makedepends=('doxygen' 'libtool')
provides=('fix8')
source=('fix8::git+https://github.com/fix8/fix8')
options=('!libtool')
#conflicts=()
#replaces=()
md5sums=('SKIP')
git_branch="master"

build() {
  cd fix8
  #git checkout $git_branch
  #autoreconf -f -i -Wall,no-obsolete
  ./bootstrap
  # ref: http://fix8.org/performance.html
  ./configure --prefix=/usr --with-mpmc=tbb --enable-bdb
  # TBB may slower on 64 bit, http://calvados.di.unipi.it/dokuwiki/doku.php?id=ffnamespace:about
  # but, FastFlow may burn your CPU http://fix8.org/faq.html#runningOne
  #./configure --prefix=/usr --enable-bdb --with-sleep=100
  make
}

package() {
  cd fix8
  make DESTDIR="$pkgdir/" install
  rm -rf $pkgdir/usr/share/man
  mv $pkgdir/usr/share/fix8/man $pkgdir/usr/share
}

pkgver() {
  cd fix8
  git describe $git_branch --always | sed 's|-|.|g'
}

check() {
  cd fix8
  make check
}
# vim:set ts=2 sw=2 et:
