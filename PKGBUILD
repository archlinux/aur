# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=crda
pkgver=1.1.2
pkgrel=4
pkgdesc="Central Regulatory Domain Agent for wireless networks"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
license=('custom')
depends=('wireless-regdb' 'libnl' 'libgcrypt' 'systemd-tools' 'iw')
makedepends=('python-m2crypto')
install=crda.install
source=(http://wireless.kernel.org/download/crda/${pkgname}-${pkgver}.tar.bz2
        set-wireless-regdom
        libnl32.patch)
md5sums=('5226f65aebacf94baaf820f8b4e06df4'
         '65c93f2ff2eb1b29d9e9fa102ae2dd45'
         'c1f7aff29f15a0364ae6f7905a1d4ae6')
                  
build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  patch -Np1 -i "$srcdir/libnl32.patch"
  sed 's|^#!/usr/bin/env python|#!/usr/bin/python2|' -i utils/key2pub.py
  make crda regdbdump
}

package() {
  # Install crda, regdbdump and udev rules
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" UDEV_RULE_DIR=/usr/lib/udev/rules.d/ SBINDIR=/usr/bin/ install
  # Adjust paths in udev rule file
  sed 's|/sbin/crda|/usr/bin/crda|' -i "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules
  # This rule automatically sets the regulatory domain when cfg80211 is loaded
  echo 'ACTION=="add" SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", RUN+="/usr/bin/set-wireless-regdom"' >> "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules

  install -D -m644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/crda/LICENSE
  
  install -D -m755 "${srcdir}"/set-wireless-regdom "${pkgdir}"/usr/bin/set-wireless-regdom
}
