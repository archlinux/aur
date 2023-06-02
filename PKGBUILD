# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: zlbgps<zlbgps@gmail.com>

set -u
pkgname='lfhex'
pkgver='0.44'
pkgrel='1'
pkgdesc='A hex editor with support for large files'
arch=('i686' 'x86_64')
#url='http://stoopidsimple.com/lfhex'
url='https://github.com/srtlg/lfhex'
license=('GPL')
depends=('qt5-base')
makedepends=('bison' 'flex')
_srcdir="${pkgname}-${pkgver}.tar.gz"
source=("${_srcdir}::${url}/archive/v${pkgver}.tar.gz")
md5sums=('6f1932e557a5a3f7d1ecb911a0ec4374')
sha256sums=('938bf8fd024a20651e1a0df8daa519fa9139bb262f1fe39e85922494e85315ce')

prepare() {
  set -u
  cd "${pkgbase}-${pkgver}/src"
  #sed -e '22i#include <sys/types.h>' -i 'expr.h'
  #rm -f 'lfhex'
  #shopt -s nullglob
  #chmod 644 *.cpp *.h *.hpp
  #shopt -u nullglob
  set +u
}

build() {
  set -u
  cd "${pkgbase}-${pkgver}/src"
  qmake-qt5

  # Bison/YACC bug. Different source files expect different file names.
  #sed -e '/expr\.tab\.h/ s:mv -f :cp -p :g' -i 'Makefile'
  sed -e '/expr\.tab\.h/ s:.(MOVE) :cp -p :g' -i 'Makefile' # issue #1

  nice make -s
  set +u
}

package() {
  set -u
  cd "${pkgbase}-${pkgver}"

  # Install binary
  install -Dm755 "src/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"

  # Install documentation
  install -Dpm644 'CONTRIBUTORS' 'README' -t "${pkgdir}/usr/share/doc/${pkgbase}/"
  set +u
}
set +u
