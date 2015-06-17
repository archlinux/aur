# Mantainer: M0Rf30
pkgname=qjackctl-svn
pkgver=734
pkgrel=1
pkgdesc="A Qt front-end for the JACK low-latency audio server"
arch=('i686' 'x86_64')
license=('GPL' 'openssl')
depends=('jack' 'qt4' 'subversion')
options=('!makeflags')
url="http://qjackctl.sourceforge.net/"
makedepends=('subversion')
provides=(qjackctl)
conflicts=(qjackctl-cvs)
_svntrunk=https://qjackctl.svn.sourceforge.net/svnroot/qjackctl/trunk
_svnmod=qjackctl-svn

build() {

 cd ${srcdir}
  rm -rf $srcdir/build

  if [ -d ${_svnmod} ]; then
    msg "Updating SVN tree ..."
    cd ${_svnmod}
    svn revert -R .
    svn up -r $pkgver || return 1
    msg "SVN update finished, starting build ..."
  else
    msg "Doing SVN checkout ..."
    svn co ${_svntrunk} ${_svnmod} -r $pkgver || return 1
    cd ${_svnmod}
    msg "SVN checkout finished, starting build ..."
  fi

  
  cp -r $srcdir/${_svnmod} $srcdir/build
  cd $srcdir/build
 
  #
  # BUILD HERE
  #
  . /etc/profile.d/qt4.sh
  autoheader
  autoconf
  ./configure --prefix=/usr

  make
}

package() {
  cd $srcdir/build

  make DESTDIR="$pkgdir" install
}
