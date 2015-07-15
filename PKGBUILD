#

pkgname=mdbtools-unixodbc-git
_gitname=mdbtools
pkgver=0.7.1.r57.g584119e
pkgrel=1
pkgdesc="A software driver based on unixodbc to access JET / MS Access database (MDB) files through ODBC."
arch=('i686' 'x86_64')
url="https://github.com/brianb/mdbtools"
depends=('unixodbc' 'flex' 'glib2' 'mdbtools-git')
makedepends=('git')
provides=('mdbtools-unixodbc')
conflicts=('mdbtools-unixodbc')
license=('LGPL')
source=("${pkgname}::git+https://github.com/brianb/${_gitname}.git")
md5sums=('SKIP')
install=mdbtools-unixodbc.install

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  sed -i -e '/unittest/d' src/odbc/Makefile.am
  autoreconf -i -f
  ./configure --prefix=/usr \
              --with-unixodbc=/usr \
              --disable-scrollkeeper \
              --disable-gmdb2 \
              --disable-gtk-doc \
              --disable-man
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}/src/odbc"

  make DESTDIR="${pkgdir}" install
}
