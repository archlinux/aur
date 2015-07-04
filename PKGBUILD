pkgname=radare2-bindings-git
pkgver=20150603.484.a938e31
pkgrel=1
pkgdesc="Language bindings for radare2 (git version)"
arch=('i686' 'x86_64')
url="https://radare.org"
license=('LGPL')
depends=('radare2-git')
makedepends=('git' 'valabind-git' 'radare2-git>='${_date}*)
provides=('r2-bindings')
conflicts=('r2-bindings')

source=("$pkgname"::"git://github.com/radare/radare2-bindings.git")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}


build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --enable=ctypes --enable=python
  (cd ./python && make)
  (cd ./ctypes && make)
  (cd ./libr/lang/p && make)
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install-vapi
  make DESTDIR="${pkgdir}/" install-python
  make DESTDIR="${pkgdir}/" install-plugins
  make DESTDIR="${pkgdir}/" install-ctypes

  rm -rf "${srcdir}"
}

# vim:set ts=2 sw=2 et:
