# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>

pkgname=fix8
pkgver=1.3.4
pkgrel=1
pkgdesc="Open Source C++ FIX Engine"
arch=('x86_64')
url="https://github.com/fix8/fix8"
license=('LGPL3')
depends=('poco-dev' 'intel-tbb')
makedepends=('doxygen' 'gtest' 'db' 'gperftools')
optdepends=('hiredis: Redis message persistence'
            'libmemcached: Memcached message persistence'
            'db: Berkeley DB message persistence'
           )
provides=('fix8')
conflicts=('fix8-git')
options=('!libtool' 'staticlibs' '!strip')
source=("git+https://github.com/fix8/${pkgname}.git#tag=${pkgver}")
sha512sums=('SKIP')

#pkgver() {
#  cd "${srcdir}/${pkgname}"
#  git describe --always | sed 's|-|.|g'
#  #printf "0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

#prepare() {
#  cd "${srcdir}/${pkgname}"
#
#  patch -p1 -i "${srcdir}/fix-seqedit-poconet-dependency.patch"
#}

build() {
  cd "${srcdir}/${pkgname}"
  ./bootstrap
  ./configure --prefix=/usr --with-mpmc=tbb --enable-bdb
  # TBB may slower on 64 bit, http://calvados.di.unipi.it/dokuwiki/doku.php?id=ffnamespace:about
  # but, FastFlow may burn a core, http://fix8.org/faq.html#runningOne
  #./configure --prefix=/usr --enable-bdb --with-sleep=100
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
  rm -rf "${pkgdir}/usr/share/man"
  mv "${pkgdir}/usr/share/${pkgname}/man" "${pkgdir}/usr/share"
  #chmod -R a+rX-w "${pkgdir}"
}

check() {
  cd "${srcdir}/${pkgname}"
  #make check
}
# vim:set ts=2 sw=2 et:
