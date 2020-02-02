# Maintainer : Javier Jardón <jjardon@gnome.org>
# Contributor: DaNiMoTh <jjdanimoth@gmail.com>
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Gereon Schomber <Gereon_Schomber@fastmail.fm>
# Contributor: Alex Belanger <i.caught.air@gmail.com>

pkgname=tao
pkgver=6.5.7
pkgrel=1
pkgdesc="Standards-based, CORBA middleware framework"
url="http://www.dre.vanderbilt.edu/~schmidt/TAO.html"
license=('custom')
arch=('i686' 'x86_64')
depends=()
options=(!libtool)
conflicts=('ace')
source=(https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-6_5_7/ACE+TAO-${pkgver}.tar.bz2
        license.txt)

build() {
  export ACE_ROOT=$srcdir/ACE_wrappers
  cd $ACE_ROOT
  echo '#include "ace/config-linux.h"' > ace/config.h
  echo 'INSTALL_PREFIX = /usr
  include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU' > include/makeinclude/platform_macros.GNU
  export LD_LIBRARY_PATH=$ACE_ROOT/lib:$LD_LIBRARY_PATH
  cd ace
  make
  cd $ACE_ROOT/apps/gperf
  make
  export TAO_ROOT=$ACE_ROOT/TAO
  cd $TAO_ROOT
  make
}
package() {
  cd $srcdir/ACE_wrappers/
  make DESTDIR="$pkgdir/" install
  cd $srcdir/ACE_wrappers/TAO
  make DESTDIR="$pkgdir/" install
}
sha1sums=('04abba9e58ddc266ab9dae8bfff0881184745a55'
          'b21054d0aa546fabe4bb0c2769401314d4a5bfe3')
