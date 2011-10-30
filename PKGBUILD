# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wireless-regdb
pkgver=2011.04.28
pkgrel=1
pkgdesc="Central Regulatory Domain Database"
arch=('any')
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
backup=(etc/conf.d/wireless-regdom)
license=('custom')
depends=('sh')
install=wireless-regdb.install
source=(http://wireless.kernel.org/download/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        crda.conf.d)
sha256sums=('ed1c3e134e34ba5f93594f6f76b90861fe8d24359c064839a2bb78736416642b'
            '192428fd959806705356107bffc97b8b379854e79bd013c4ee140e5202326e2b')

package() {
  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
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
  install -D -m644 ${srcdir}/crda.conf.d ${pkgdir}/etc/conf.d/wireless-regdom
  for dom in $(grep ^country ${srcdir}/${pkgname}-${pkgver}/db.txt | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> ${pkgdir}/etc/conf.d/wireless-regdom.tmp
  done
  sort -u ${pkgdir}/etc/conf.d/wireless-regdom.tmp >> ${pkgdir}/etc/conf.d/wireless-regdom
  rm -f ${pkgdir}/etc/conf.d/wireless-regdom.tmp

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
