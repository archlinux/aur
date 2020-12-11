# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: zlbgps<zlbgps@gmail.com>

set -u
pkgname='lfhex'
pkgver='0.42'
pkgrel='2'
pkgdesc='A hex editor with support for large files'
arch=('i686' 'x86_64')
#url='http://stoopidsimple.com/lfhex'
url='https://github.com/srtlg/lfhex'
license=('GPL')
depends=('qt4')
makedepends=('bison' 'flex')
_srcdir="${pkgname}-${pkgver}.tar.gz"
source=("${_srcdir}::${url}/archive/v${pkgver}.tar.gz")
md5sums=('95a31935c53f0f73c0da4e2f0a0d93b9')
sha256sums=('f17543de8264e4c6eb7535dbc9dfb26ba787e1736972d14fb97e2e8a4ddcc034')

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
  qmake-qt4

  # Bison/YACC bug. Different source files expect different file names.
  sed -e '/expr\.tab\.h/ s:mv -f :cp -p :g' -i 'Makefile'

  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
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
