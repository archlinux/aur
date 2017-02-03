# Maintainer: aksr <aksr at t-com dot me>
pkgname=mdocml-cvs
pkgver=2017.02.01.23.00.00
pkgrel=1
pkgdesc="A suite of tools compiling mdoc, the roff macro language for manual pages, and man."
arch=('i686' 'x86_64')
url="http://mdocml.bsd.lv/"
license=('ISC')
depends=('sqlite')
makedepends=('cvs')
provides=('mdocml' 'mandoc')
conflicts=('mdocml')

_cvsroot=":ext:anoncvs@mdocml.bsd.lv:/cvs"
_cvsmod="mdocml"

prepare() {
  cd ${srcdir}
  msg "Connecting to CVS server..."
  export CVS_RSH=ssh
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
  cat CVS/Tag | sed 's/^D//'
}

prepare() {
  # adapt configuration
  cat << END > ${srcdir}/${_cvsmod}-build/configure.local
PREFIX="/usr"
SBINDIR="/usr/bin"
MANDIR="/usr/share/man"
EXAMPLEDIR="/usr/share/mandoc/examples"
BINM_MAN="mman"
BINM_SOELIM="msoelim"
BINM_APROPOS="mapropos"
BINM_WHATIS="mwhatis"
MANM_MAN="mandoc_man"
MANM_MDOC="mandoc_mdoc"
MANM_ROFF="mandoc_roff"
# default cflags
$(grep -m1 'CFLAGS=' configure)
# add our cflags
CFLAGS="\${CFLAGS} $CFLAGS"
END
}

build() {
  cd ${srcdir}/${_cvsmod}-build
  ./configure
  make -j1
}

package() {
  cd ${srcdir}/${_cvsmod}-build
  make DESTDIR="$pkgdir" -j1 install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname%-*}/LICENSE
}

