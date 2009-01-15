# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=crda
pkgver=0.9.5
_regdbver=2009-01-15
pkgrel=2
pkgdesc="Central Regulatory Domain Agent"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
license=('custom')
depends=('libnl' 'libgcrypt' 'udev' 'iw')
makedepends=('python-m2crypto')
source=(http://wireless.kernel.org/download/crda/$pkgname-$pkgver.tar.bz2
        http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/${_regdbver}-regulatory.bin
        crda.rc
        crda.conf.d)
backup=(etc/conf.d/wireless-regdom)
md5sums=('cee459e588441f713a96ae2fb0472d7f'
         'a0db99e5385c876b6da7e2869546f6e2'
         '014eef3f8655e9a130064ec6891317fc'
         '2374dcf1c6530332f375e5362b80169b')
                  
build() {
  # Install crda, regdbdump and udev rules
  msg "Compiling and installing crda ..."
  cd $srcdir/$pkgname-$pkgver
  make crda regdbdump || return 1
  make DESTDIR=$pkgdir install || return 1

  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m444 $srcdir/${_regdbver}-regulatory.bin $pkgdir/usr/lib/crda/regulatory.bin || return 1
  if $pkgdir/sbin/regdbdump $pkgdir/usr/lib/crda/regulatory.bin > /dev/null; then
    msg "Regulatory database verification was succesful."
  else
    error "Regulatory database verification failed."
    return 1
  fi
  
  msg "Installing license ..."
  install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/crda/LICENSE || return 1
  
  msg "Installing boot scripts ..."
  install -D -m755 $srcdir/crda.rc $pkgdir/etc/rc.d/wireless-regdom || return 1
  install -D -m644 $srcdir/crda.conf.d $pkgdir/etc/conf.d/wireless-regdom || return 1
  for dom in $($pkgdir/sbin/regdbdump $pkgdir/usr/lib/crda/regulatory.bin | grep ^country | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> $pkgdir/etc/conf.d/wireless-regdom || return 1
  done
}
