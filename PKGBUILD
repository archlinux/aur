# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=crda
pkgver=1.1.2
pkgrel=1
pkgdesc="Central Regulatory Domain Agent for wireless networks"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
license=('custom')
depends=('wireless-regdb' 'libnl' 'libgcrypt' 'udev' 'iw')
makedepends=('python-m2crypto')
install=crda.install
source=(http://wireless.kernel.org/download/crda/${pkgname}-${pkgver}.tar.bz2
        crda.rc)
md5sums=('5226f65aebacf94baaf820f8b4e06df4'
         '014eef3f8655e9a130064ec6891317fc')
                  
build() {
  msg "Compiling crda ..."
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed 's|^#!/usr/bin/env python|#!/usr/bin/python2|' -i utils/key2pub.py
  make crda regdbdump
}

package() {
  # Install crda, regdbdump and udev rules
  msg "Installing crda ..."
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  # This rule automatically sets the regulatory domain when cfg80211 is loaded
  echo 'ACTION=="add" SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", RUN+="/etc/rc.d/wireless-regdom start >/dev/null"' >> "${pkgdir}"/lib/udev/rules.d/85-regulatory.rules

  msg "Installing license ..."
  install -D -m644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/crda/LICENSE
  
  msg "Installing boot script ..."
  install -D -m755 "${srcdir}"/crda.rc "${pkgdir}"/etc/rc.d/wireless-regdom
}
