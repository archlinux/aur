# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wireless-regdb-pentest
_pkgname=wireless-regdb
pkgver=2018.10.24
pkgrel=1
pkgdesc="Central Regulatory Domain Database with txpower/channels modified for pentesters. please respect the law in your country"
arch=('any')
url="http://wireless.kernel.org/en/developers/Regulatory"
backup=(etc/conf.d/wireless-regdom)
license=('custom')
depends=('sh' 'libnl' 'libgcrypt' 'systemd' 'iw')
makedepends=('crda' 'python2-m2crypto' 'python-attrs' 'python-m2crypto')
conflicts=('wireless-regdb' 'crda')
provides=('wireless-regdb' 'crda')
source=(https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-${pkgver}.tar.xz
        'crda.conf.d'
	'db.txt'
	'set-wireless-regdom'
	'0001-Makefile-Link-libreg.so-against-the-crypto-library.patch'
	'0001-Makefile-Don-t-run-ldconfig.patch'
	'https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snapshot/crda-4.14.tar.gz')

sha256sums=('0d3e845ac77d21aac9b88642c3dd043a83e3920d706b63d5e5c31dffdbec9116'
            '192428fd959806705356107bffc97b8b379854e79bd013c4ee140e5202326e2b'
            '4cf0a9c20540bc1974ae7e14007d6d7538aa27c7f1d8e489cecdc40fc71ed699'
            '603ce97da5cce3f5337e99007ce04e2f295bb33a36b308794884011f7bcabaf3'
            '96b2068b27202f8bc78009869520e396cb3f3ac7a826efef06d0fc41047f2520'
            'ff52990cf9295e5cebcf07ebbf2a96e225d97088573edcc898b29ce33a0fb663'
            '5a8f35bb8b27474f466b0e75d451ba917433d8aab1889678a64d9c4e72a8b8c2')

prepare() {
  tar xf crda-4.14.tar.gz
  sed 's|^#!/usr/bin/env python|#!/usr/bin/env python2|' -i "${srcdir}"/crda-4.14/utils/key2pub.py
  cd "${srcdir}"/crda-4.14
  patch -p1 -i "${srcdir}"/0001-Makefile-Link-libreg.so-against-the-crypto-library.patch
  patch -p1 -i "${srcdir}"/0001-Makefile-Don-t-run-ldconfig.patch
  cp "${srcdir}"/db.txt "${srcdir}"/"${_pkgname}"-"${pkgver}"/db.txt
}

build() {
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/
  make
  cp "${srcdir}"/"${_pkgname}"-"${pkgver}"/*.key.pub.pem "${srcdir}"/crda-4.14/pubkeys/	 
  cd "${srcdir}"/crda-4.14
  make all_noverify
}

package() {
  cd "${srcdir}"/crda-4.14
  make DESTDIR="${pkgdir}" UDEV_RULE_DIR=/usr/lib/udev/rules.d/ SBINDIR=/usr/bin/ install
  # Adjust paths in udev rule file
  sed 's|/sbin/crda|/usr/bin/crda|' -i "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules
  # This rule automatically sets the regulatory domain when cfg80211 is loaded
  echo 'ACTION=="add" SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", RUN+="/usr/bin/set-wireless-regdom"' >> "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules

  install -D -m644 "${srcdir}"/crda-4.14/LICENSE "${pkgdir}"/usr/share/licenses/crda/LICENSE
  
  install -D -m755 "${srcdir}"/set-wireless-regdom "${pkgdir}"/usr/bin/set-wireless-regdom
  #cd "${srcdir}"/${_pkgname}-${pkgver}/
 # make  
  # Install and verify regulatory.bin file
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.bin "${pkgdir}"/usr/lib/crda/regulatory.bin
  # This creates a depend/makedepend loop:
  # crda depends on wireless-regdb (but strictly doesn't makedepend on it)
  # wireless-regdb makedepends on crda
  install -d -m644 "${pkgdir}"/usr/lib/crda/pubkeys
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/*.pem "${pkgdir}"/usr/lib/crda/pubkeys/
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
