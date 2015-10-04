# updated by devnull [at] libcrack [dot] so
pkgname=('radare2-bindings-git' 'radare2-pipe-git')
basename='radare2-bindings-git'
pkgver=20151004.538.1f243fb
pkgrel=1
pkgdesc="Language bindings for radare2 (git version)"
arch=('i686' 'x86_64')
url="https://radare.org"
license=('LGPL')
depends=('radare2')
makedepends=('git' 'valabind' 'radare2')

source=("$pkgname"::"git://github.com/radare/radare2-bindings.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}


build() {
  cd "${srcdir}/${basename}"

  ./configure \
      --prefix="/usr" \
      --enable="python"

  #PYTHON_CONFIG=python3-config make
  make

  (cd r2pipe/python && python setup.py build)
}

package_radare2-pipe-git() {
  provides=('radare2-pipe')

  cd "${srcdir}/${basename}"
  (cd r2pipe/python && python setup.py install --root "${pkgdir}")
}

package_radare2-bindings-git() {
  provides=('radare2-bindings')
  conflicts=('radare2-bindings')

  cd "${srcdir}/${basename}"
  #PYTHON_CONFIG=python3-config make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
