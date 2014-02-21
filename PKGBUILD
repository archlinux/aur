# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=crda
pkgver=3.13
pkgrel=1
pkgdesc="Central Regulatory Domain Agent for wireless networks"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
license=('custom')
depends=('wireless-regdb' 'libnl' 'libgcrypt' 'systemd' 'iw')
makedepends=('python2-m2crypto')
install=crda.install
source=(https://kernel.org/pub/software/network/crda/${pkgname}-${pkgver}.tar.xz
        set-wireless-regdom
        0001-crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
        0002-crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
        0001-Makefile-Link-libreg.so-against-the-crypto-library.patch
        0001-Makefile-Don-t-run-ldconfig.patch)
sha256sums=('2f85da7ab0170b140d6ed62596c8f268d4a7dedecf84cac7182ada979742ff59'
            '603ce97da5cce3f5337e99007ce04e2f295bb33a36b308794884011f7bcabaf3'
            '8920b5988eb1befe13f88ce5c0dbbf30c294796d613681a2b0925f6f8534c51b'
            'ced0a372b06ffd64f90be77d7267c9d8cc10413bc017c3154b7208dbf69be3cb'
            '96b2068b27202f8bc78009869520e396cb3f3ac7a826efef06d0fc41047f2520'
            'ff52990cf9295e5cebcf07ebbf2a96e225d97088573edcc898b29ce33a0fb663')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed 's|^#!/usr/bin/env python|#!/usr/bin/python2|' -i utils/key2pub.py
  patch -p1 -i "${srcdir}"/0001-crda-Fix-the-linking-order-to-avoid-compilation-erro.patch
  patch -p1 -i "${srcdir}"/0002-crda-Add-DESTDIR-support-in-install-libreg-rules-in-.patch
  patch -p1 -i "${srcdir}"/0001-Makefile-Link-libreg.so-against-the-crypto-library.patch
  patch -p1 -i "${srcdir}"/0001-Makefile-Don-t-run-ldconfig.patch
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
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
