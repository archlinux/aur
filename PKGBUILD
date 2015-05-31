# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=intel-openamt
pkgver=213
pkgrel=2
pkgdesc='Intel OpenAMT HECI kernel module'

arch=('i686' 'x86_64')
url='http://www.openamt.org/'
license=('GPL2')
depends=('linux')
source=('remove-depmod.patch')
md5sums=('8fd09c5398c5674e0c8d1a443362c1b1')
install=intel-openamt.install

_svntrunk=https://openamt.svn.sourceforge.net/svnroot/openamt
_svnmod=openamt

_kernver=`uname -r`

build() {
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  msg "Patching sources..."
  cd $srcdir/openamt
  patch -Np1 -i ../remove-depmod.patch
  
  cd $srcdir/openamt/heci/trunk
  make
  make INSTDIR="$pkgdir/lib/modules/${_kernver}/kernel/drivers/char" install
  

}
