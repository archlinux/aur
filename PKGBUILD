# $Id: $
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=crda
pkgver=0.9.4
_regdbver=2008-11-17
pkgrel=1
pkgdesc="Central Regulatory Domain Agent"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
license=('custom')
depends=('libnl' 'libgcrypt' 'udev')
makedepends=('python-m2crypto')
source=(http://wireless.kernel.org/download/crda/$pkgname-$pkgver.tar.bz2
        http://wireless.kernel.org/download/wireless-regdb/wireless-regdb-master-${_regdbver}.tar.bz2)
md5sums=('dddd9c0f08e7e447a29fc5b8eed5179f'
         '107aba5bb47c776bf7682bf0553f46e2')

build() {
  # Install crda, regdbdump and udev rules
  msg "Compiling and installing crda ..."
  cd $srcdir/$pkgname-$pkgver
  make crda regdbdump || return 1
  make DESTDIR=$pkgdir install || return 1

  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m444 $srcdir/wireless-regdb-master-${_regdbver}/regulatory.bin $pkgdir/usr/lib/crda/regulatory.bin || return 1
  if $pkgdir/sbin/regdbdump $pkgdir/usr/lib/crda/regulatory.bin > /dev/null; then
    msg "Regulatory database verification was succesful."
  else
    error "Regulatory database verification failed."
    return 1
  fi
  
  msg "Installing license ..."
  install -D -m644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/crda/LICENSE || return 1
}
