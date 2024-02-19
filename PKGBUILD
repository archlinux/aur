# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname='unqlite-git'
_pkgname='unqlite'
pkgver=1.1.9.r35.g057067a
pkgrel=1
pkgdesc='Embeddable NoSQL DB Engine library'
arch=('i686' 'x86_64')
url='http://unqlite.org'
license=('BSD-2-Clause')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
depends=('glibc')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/symisc/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  rm -fr build
  mkdir build
}

build() {
  cd $pkgname/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LIBDIR=lib \
    ..
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir/" install
  install -Dm0644 ../LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
