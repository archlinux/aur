# $Id: PKGBUILD 12108 2010-02-27 14:47:28Z ibiru $
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>

pkgname=em8300
pkgver=0.18.0
_kernver=2.6.35-ARCH
pkgrel=2
pkgdesc="DXR3 and Hollywood+ driver"
arch=('i686' 'x86_64')
url="http://dxr3.sourceforge.net/"
license=('GPL2')
depends=('kernel26>=2.6.33' "em8300-utils=$pkgver")
makedepends=('kernel26-headers>=2.6.33')
install=em8300.install
source=(http://downloads.sourceforge.net/project/dxr3/em8300/${pkgver}/em8300-${pkgver}.tar.gz
2.6.35.patch)
md5sums=('2ef10f5159508a31a877e7e6d18c6896'
         '922a6f5641a805ca05c2b712caeed9f8')

build() {
  cd $srcdir/$pkgname-$pkgver/
  patch -p1 < $srcdir/2.6.35.patch
  cd $srcdir/$pkgname-$pkgver/modules
    rm -f update_em8300_version.sh

  sed -i "s!^KERNEL_LOCATION := .*\$!KERNEL_LOCATION := /lib/modules/${_kernver}/build!" Makefile

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  chmod 644 $pkgdir/lib/modules/*/em8300/*.ko
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/*.install
}
