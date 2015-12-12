pkgname=spim-svn
pkgver=675
pkgrel=2
pkgdesc="A MIPS32 simulator (SVN version)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/spimsimulator/"
license=('custom:BSD')
groups=('emulators')
depends=('glibc')
makedepends=('subversion')
conflicts=('spim')
provides=('spim')

_svntrunk='svn+http://svn.code.sf.net/p/spimsimulator/code'
source=("${_svntrunk}/spim"
        "${_svntrunk}/CPU"
        'flex-version-check.patch')
md5sums=("SKIP" "SKIP"
         '27ccf0eab447f5d4343898b6f9293e8a')

pkgver() {
  cd "${srcdir}/spim"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

prepare() {
  cd ${srcdir}/CPU

  patch -p0 -i ../../flex-version-check.patch
}

build() {
  cd ${srcdir}/spim

  make
}

package() {
  install -Dm644 ${srcdir}/spim/README ${pkgdir}/usr/share/licenses/${pkgname}/README

  cd ${srcdir}/spim
  install -dDm755 ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install
}
