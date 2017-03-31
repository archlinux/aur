# Contributor: noonov <noonov@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=qemacs-cvs
pkgver=0.3.2.r2017.03.31
pkgrel=1
pkgdesc="A very small but powerful UNIX editor."
arch=('i686' 'x86_64')
url="http://bellard.org/qemacs/"
license=('LGPL2.1')
depends=('libpng' 'libxv')
optdepends=('jp2a: for converting JPG images to ASCII')
makedepends=('cvs' 'texi2html')
provides=('qemacs')
conflicts=('qemacs')

_cvsroot=":pserver:anonymous@cvs.savannah.nongnu.org:/sources/qemacs"
_cvsmod="qemacs"

prepare() {
  cd ${srcdir}
  msg "Connecting to CVS server..."
  if [[ -d ${_cvsmod}/CVS ]]; then
    (cd ${_cvsmod} && cvs -z3 update -d)
  else
    cvs -z3 -d ${_cvsroot} co -D $(echo ${pkgver} | grep -o "r.*" | sed 's/^r//;s/\./-/g') -f ${_cvsmod}
  fi
  msg "CVS checkout done or server timeout"
  msg "Starting make..."
  rm -rf ${_cvsmod}-build
  cp -r ${_cvsmod} ${_cvsmod}-build
}

pkgver() {
  cd ${srcdir}/${_cvsmod}-build
  printf "%s.r%s" "$(head -1 Changelog  | awk '{print $2}' | sed 's/dev://')" \
                  "$(cvs -q log | grep '^date:' | sort | tail -n 1 | cut -d ' ' -f 2 | tr -d '/' | sed 's/-/./g')"
}

build() {
  cd ${srcdir}/${_cvsmod}-build
  ./configure --prefix=/usr --enable-x11 --enable-xv --enable-xshm --enable-xrender
  make -j1
}

package() {
  cd ${srcdir}/${_cvsmod}-build
  make -j1 DESTDIR=$pkgdir prefix="/usr/" datadir="/usr/share" mandir="/usr/share/man" install
  install -Dm644 config.eg $pkgdir/usr/share/qe/config.eg
}

