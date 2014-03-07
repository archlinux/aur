pkgname=spim-svn
pkgver=641
pkgrel=1
pkgdesc="A MIPS32 simulator (SVN version)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/spimsimulator/"
license=('custom:BSD')
groups=('emulators')
depends=()
makedepends=('bison' 'flex' 'subversion')
conflicts=('spim')
provides=('spim')

_svntrunk='http://svn.code.sf.net/p/spimsimulator/code/'

_svn_update() {
    if [ -d $1/.svn ]; then
        cd $1
        svn up -r ${pkgver}
    else
        svn co ${_svntrunk}/$1 --config-dir ./ -r ${pkgver} $1
    fi
}

build() { 
  cd $srcdir
  _svn_update spim
  _svn_update CPU

  cd ${srcdir}/spim

  make
}

package() {
  install -Dm644 ${srcdir}/spim/README ${pkgdir}/usr/share/licenses/${pkgname}/README

  cd ${srcdir}/spim
  install -dDm755 ${pkgdir}/usr/bin
  make DESTDIR=${pkgdir} install
}
