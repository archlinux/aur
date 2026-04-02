# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=cbftp-svn
pkgver=r1301
pkgrel=1
pkgdesc='Advanced multi-purpose FTP/FXP client with ncurses interface focused on efficient large-scale data spreading.'
arch=('x86_64')
url='https://cbftp.glftpd.io'
license=('MIT')
depends=('openssl' 'ncurses' 'glibc' 'gcc-libs')
makedepends=('subversion' 'make')
provides=('cbftp')
conflicts=('cbftp')
source=("${pkgname}::svn+https://cbftp.glftpd.io/svn/cbftp/")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  local ver
  ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${pkgname}"
  # cbftp's Makefile breaks when receiving external flags;
  # its build system concatenates commands incorrectly with them.
  unset CFLAGS CXXFLAGS LDFLAGS
  make -j"$(nproc)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 bin/cbftp bin/cbftp-debug bin/datafilecat bin/datafilewrite -t "${pkgdir}/usr/bin"
  install -Dm644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}
