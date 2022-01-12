_pkgname=tagainijisho
pkgname=${_pkgname}-git
pkgver=1.1.91.r1.a84d46b
pkgrel=1
pkgdesc="Free Japanese dictionary and study assistant (qt5)"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://www.tagaini.net/"
license=('GPL3')
depends=('qt5-base>=5.4' 'qt5-tools' 'sqlite3>=3.7.9')
makedepends=('cmake>=2.8.12' 'desktop-file-utils' 'git')
conflicts=('tagainijisho')
source=()
md5sums=()

prepare() {
  if [ ! -d "${srcdir}/${_pkgname}" ]; then
    cd ${srcdir}
    git clone https://github.com/Gnurou/tagainijisho.git --branch master --single-branch --depth 1
  else
    cd "${srcdir}/${_pkgname}"
    git fetch --depth 1 origin master
    git reset --hard origin/master
  fi
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    _revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
    echo "1.1.91.${_revision}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  CFLAGS=`echo $CFLAGS | sed 's/-ffast-math//'` cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt5 . || return 1
  make $MAKEFLAGS || return 1
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR=$pkgdir install || return 1
}
# vim:set ts=2 sw=2 et:
