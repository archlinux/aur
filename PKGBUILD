# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wireless-regdb-pentest
_pkgname=wireless-regdb
pkgver=2020.04.29
pkgrel=1
pkgdesc="Central Regulatory Domain Database with txpower/channels modified for pentesters. please respect the law in your country"
arch=('any')
url="http://wireless.kernel.org/en/developers/Regulatory"
backup=(etc/conf.d/wireless-regdom)
license=('custom')
depends=('sh' 'libnl' 'libgcrypt' 'systemd' 'iw')
makedepends=( 'python2-m2crypto' 'python-attrs' 'python-m2crypto')
conflicts=('wireless-regdb' 'crda')
provides=('wireless-regdb' 'crda')
source=(https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-${pkgver}.tar.xz
        'crda.conf.d'
	'db.txt'
	'set-wireless-regdom'
	'0001-Makefile-Link-libreg.so-against-the-crypto-library.patch'
	'0001-Makefile-Don-t-run-ldconfig.patch'
	'https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snapshot/crda-4.14.tar.gz')

sha256sums=('89fd031aed5977c219a71501e144375a10e7c90d1005d5d086ea7972886a2c7a'
            '192428fd959806705356107bffc97b8b379854e79bd013c4ee140e5202326e2b'
            'f5af8c98a87095443ba0a273d8f39c02c2544bee6119bbebac09e7fbe779d858'
            '603ce97da5cce3f5337e99007ce04e2f295bb33a36b308794884011f7bcabaf3'
            '96b2068b27202f8bc78009869520e396cb3f3ac7a826efef06d0fc41047f2520'
            'ff52990cf9295e5cebcf07ebbf2a96e225d97088573edcc898b29ce33a0fb663'
            '5a8f35bb8b27474f466b0e75d451ba917433d8aab1889678a64d9c4e72a8b8c2')

prepare() {
  cd "${srcdir}"/crda-4.14
  patch -p1 -i "${srcdir}"/0001-Makefile-Link-libreg.so-against-the-crypto-library.patch
  patch -p1 -i "${srcdir}"/0001-Makefile-Don-t-run-ldconfig.patch
  sed 's|^#!/usr/bin/env python|#!/usr/bin/env python2|' -i "${srcdir}"/crda-4.14/utils/key2pub.py
  cp "${srcdir}"/db.txt "${srcdir}"/"${_pkgname}"-"${pkgver}"/db.txt
}

build() {
  export CC=gcc
  export CXX=g++
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"/
  make mrproper
  export REGDB_AUTHOR=root
  make
  cd "${srcdir}"/crda-4.14
  cp "${srcdir}"/"${_pkgname}"-"${pkgver}"/root.key.pub.pem pubkeys/
  make REG_BIN="${srcdir}"/"${_pkgname}"-"${pkgver}"/regulatory.bin 
}

package() {
  # Install and verify regulatory.bin file
  cd "${srcdir}"/crda-4.14
  install -d -m755 "${pkgdir}"/usr/lib
  make DESTDIR="${pkgdir}" UDEV_RULE_DIR=/usr/lib/udev/rules.d/ SBINDIR=/usr/bin/ install
  cd "${srcdir}"/"${_pkgname}"-"${pkgver}"
  msg "Installing and verifying the regulatory.bin file ..."
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/root.key.pub.pem "${pkgdir}"/usr/lib/crda/pubkeys/root.key.pub.pem
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.bin "${pkgdir}"/usr/lib/crda/regulatory.bin
 if LD_LIBRARY_PATH="${srcdir}"/crda-4.14 "${srcdir}"/crda-4.14/regdbdump "${pkgdir}"/usr/lib/crda/regulatory.bin > /dev/null; then
    msg "Regulatory database verification was succesful."
  else
    error "Regulatory database verification failed."
    return 1
  fi
  install -d -m755 "${pkgdir}"/usr/lib/firmware
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.db "${pkgdir}"/usr/lib/firmware/regulatory.db
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.db.p7s "${pkgdir}"/usr/lib/firmware/regulatory.db.p7s
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/wireless-regdb/LICENSE
  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/regulatory.bin.5 "${pkgdir}"/usr/share/man/man5/regulatory.bin.5

  #msg "Installing /etc/conf.d/wireless-regdom ..."
  install -D -m644 "${srcdir}"/crda.conf.d "${pkgdir}"/etc/conf.d/wireless-regdom
  for dom in $(grep ^country "${srcdir}"/${_pkgname}-${pkgver}/db.txt | cut -d' ' -f2 | sed 's|:||g'); do
    echo "#WIRELESS_REGDOM=\"${dom}\"" >> "${pkgdir}"/etc/conf.d/wireless-regdom.tmp
  done
  sort -u "${pkgdir}"/etc/conf.d/wireless-regdom.tmp >> "${pkgdir}"/etc/conf.d/wireless-regdom
  rm "${pkgdir}"/etc/conf.d/wireless-regdom.tmp

  install -D -m644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
