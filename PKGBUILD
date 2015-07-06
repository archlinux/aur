# Contributor: noonov <noonov@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=qemacs-cvs
pkgver=20131223
pkgrel=1
pkgdesc="A very small but powerful UNIX editor."
arch=('i686' 'x86_64')
url="http://bellard.org/qemacs/"
license=('LGPL2.1')
depends=('libpng' 'libxv')
makedepends=('cvs' 'texi2html')
provides=('qemacs')
conflicts=('qemacs')
source=()
md5sums=('SKIP')

_cvsroot=":pserver:anonymous@cvs.savannah.nongnu.org:/sources/qemacs"
_cvsmod="qemacs"
pkgver() { date +'%Y%m%d'; }

build() {
  cd ${srcdir}

  msg "Connecting to CVS server..."
  if [[ -d ${_cvsmod}/CVS ]]; then
    (cd ${_cvsmod} && cvs -z3 update -d)
  else
    cvs -z3 -d ${_cvsroot} co -D ${pkgver} -f ${_cvsmod}
  fi
  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${_cvsmod}-build
  cp -r ${_cvsmod} ${_cvsmod}-build

  cd ${srcdir}/${_cvsmod}-build

  sed -i 's|texi2html -monolithic -number|texi2html -monolithic|' Makefile

  ./configure --prefix=/usr
  make -j1
}

package() {
  cd ${srcdir}/${_cvsmod}-build
  make -j1 DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/man ${pkgdir}/usr/share/man
  ln -s qe.1.gz ${pkgdir}/usr/share/man/man1/qemacs.1.gz
  install -D -m644 config.eg ${pkgdir}/usr/share/qe/config.eg
}

