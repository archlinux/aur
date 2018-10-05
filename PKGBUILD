# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wireless-regdb-pentest
_pkgname=wireless-regdb
pkgver=2018.09.07
pkgrel=1
pkgdesc="Central Regulatory Domain Database with txpower/channels modified for pentesters. please respect the law in your country"
arch=('any')
url="http://wireless.kernel.org/en/developers/Regulatory"
backup=(etc/conf.d/wireless-regdom)
license=('custom')
depends=('sh' 'libnl' 'libgcrypt' 'systemd' 'iw')
makedepends=('crda' 'python2-m2crypto')
conflicts=('wireless-regdb' 'crda')
provides=('wireless-regdb' 'crda')
source=(https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-${pkgver}.tar.xz
        'crda.conf.d'
	'db.txt.patch'
	'db.txt2.patch'
	'set-wireless-regdom'
	'0001-Makefile-Link-libreg.so-against-the-crypto-library.patch'
	'0001-Makefile-Don-t-run-ldconfig.patch'
	'0002-fix-gcc6.patch'
	'https://www.kernel.org/pub/software/network/crda/crda-3.18.tar.xz')

sha256sums=('a36b8147f1a3e98e1fd44321a4b8d7ad2f03cac98cdf527ccb1693342f08d65a'
            '192428fd959806705356107bffc97b8b379854e79bd013c4ee140e5202326e2b'
            '68cec28c36289ff3d04ba1b8ccce38e3b414bece53d7d26390ed6541ccbdb2c1'
            '9c266cb90c9492f617c6b89242723fc81ffa2dc8817d0a6f03dfcffd0d077fbf'
            '603ce97da5cce3f5337e99007ce04e2f295bb33a36b308794884011f7bcabaf3'
            '96b2068b27202f8bc78009869520e396cb3f3ac7a826efef06d0fc41047f2520'
            'ff52990cf9295e5cebcf07ebbf2a96e225d97088573edcc898b29ce33a0fb663'
            '49507df6694a9970784bce4ed0d36b9130517638072e721cebe0661fe7ba0f5e'
            '43fcb9679f8b75ed87ad10944a506292def13e4afb194afa7aa921b01e8ecdbf')

prepare() {
  tar xf crda-3.18.tar.xz
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"
  patch -Np1 -i ../db.txt.patch
  patch -Np0 -i ../db.txt2.patch
  sed -i 's/python/python3/' "${srcdir}"/"${_pkgname}"-"${pkgver}"/db2bin.py 
  cd "${srcdir}/crda-3.18"
  patch -Np1 -i ../0002-fix-gcc6.patch
}

package() {
  cd "${srcdir}"/${_pkgname}-${pkgver}/
  make
  cp root.key.pub.pem "${srcdir}"/crda-3.18/pubkeys/ 
  cd "${srcdir}"/crda-3.18
  sed 's|^#!/usr/bin/env python|#!/usr/bin/python2|' -i utils/key2pub.py
  patch -p1 -i "${srcdir}"/0001-Makefile-Link-libreg.so-against-the-crypto-library.patch
  patch -p1 -i "${srcdir}"/0001-Makefile-Don-t-run-ldconfig.patch
  make
  
  make DESTDIR="${pkgdir}" UDEV_RULE_DIR=/usr/lib/udev/rules.d/ SBINDIR=/usr/bin/ install
  # Adjust paths in udev rule file
  sed 's|/sbin/crda|/usr/bin/crda|' -i "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules
  # This rule automatically sets the regulatory domain when cfg80211 is loaded
  echo 'ACTION=="add" SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", RUN+="/usr/bin/set-wireless-regdom"' >> "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules

  install -D -m644 "${srcdir}"/crda-3.18/LICENSE "${pkgdir}"/usr/share/licenses/crda/LICENSE
  
  install -D -m755 "${srcdir}"/set-wireless-regdom "${pkgdir}"/usr/bin/set-wireless-regdom
  cd "${srcdir}"/${_pkgname}-${pkgver}/
  make  
  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.bin "${pkgdir}"/usr/lib/crda/regulatory.bin
  # This creates a depend/makedepend loop:
  # crda depends on wireless-regdb (but strictly doesn't makedepend on it)
  # wireless-regdb makedepends on crda
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/sforshee.key.pub.pem "${pkgdir}"/usr/lib/crda/pubkeys/sforshee.key.pub.pem
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/wireless-regdb/LICENSE
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.bin.5 "${pkgdir}"/usr/share/man/man5/regulatory.bin.5

  msg "Installing /etc/conf.d/wireless-regdom ..."
  install -D -m644 "${srcdir}"/crda.conf.d "${pkgdir}"/etc/conf.d/wireless-regdom
  for dom in $(grep ^country "${srcdir}"/${_pkgname}-${pkgver}/db.txt | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> "${pkgdir}"/etc/conf.d/wireless-regdom.tmp
  done
  sort -u "${pkgdir}"/etc/conf.d/wireless-regdom.tmp >> "${pkgdir}"/etc/conf.d/wireless-regdom
  rm "${pkgdir}"/etc/conf.d/wireless-regdom.tmp

  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.db "${pkgdir}"/usr/lib/firmware/regulatory.db
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.db.p7s "${pkgdir}"/usr/lib/firmware/regulatory.db.p7s
}
