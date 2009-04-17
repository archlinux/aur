# $Id: PKGBUILD 28298 2009-02-28 18:22:27Z thomas $
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wireless-regdb
pkgver=2009.04.17
pkgrel=1
pkgdesc="Central Regulatory Domain Database"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
depends=()
install=wireless-regdb.install
source=(http://wireless.kernel.org/download/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        crda.conf.d)
backup=(etc/conf.d/wireless-regdom)
md5sums=('544e3c504026a558d34db685dd1903cb'
         '2374dcf1c6530332f375e5362b80169b')
                  
build() {
  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
  # If crda is installed, the wireless regdb can be verified using regdbdump
  # Keep this step optional so no depend/makedepend loop is created
  if [ -x /sbin/regdbdump ]; then
    if /sbin/regdbdump ${pkgdir}/usr/lib/crda/regulatory.bin > /dev/null; then
      msg "Regulatory database verification was succesful."
    else
      error "Regulatory database verification failed."
      return 1
    fi
  else
    warning "Crda is not installed, regulatory database could not be verified."
  fi
  
  msg "Installing /etc/conf.d/wireless-regdom ..."
  install -D -m644 ${srcdir}/crda.conf.d ${pkgdir}/etc/conf.d/wireless-regdom || return 1
  for dom in $(grep ^country ${srcdir}/${pkgname}-${pkgver}/db.txt | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> ${pkgdir}/etc/conf.d/wireless-regdom.tmp || return 1
  done
  sort -u ${pkgdir}/etc/conf.d/wireless-regdom.tmp >> ${pkgdir}/etc/conf.d/wireless-regdom || return 1
  rm -f ${pkgdir}/etc/conf.d/wireless-regdom.tmp || return 1
}
