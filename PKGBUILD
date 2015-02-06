# Maintainer: Petko Bordjukov <bordjukov@gmail.com>

_pkgname=crda
pkgname=$_pkgname-git
pkgver=r282.805d84a
pkgrel=1
pkgdesc="Central Regulatory Domain Agent for wireless networks"
arch=(i686 x86_64)
url="http://wireless.kernel.org/en/developers/Regulatory/CRDA"
license=('custom')
depends=('wireless-regdb' 'libnl' 'libgcrypt' 'systemd' 'iw')
makedepends=('python2-m2crypto')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=crda.install
source=($_pkgname::git+https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git
        set-wireless-regdom
        0001-Makefile-Link-libreg.so-against-the-crypto-library.patch
        0001-Makefile-Don-t-run-ldconfig.patch)
sha256sums=('SKIP'
            '603ce97da5cce3f5337e99007ce04e2f295bb33a36b308794884011f7bcabaf3'
            '96b2068b27202f8bc78009869520e396cb3f3ac7a826efef06d0fc41047f2520'
            'ff52990cf9295e5cebcf07ebbf2a96e225d97088573edcc898b29ce33a0fb663')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/${_pkgname}
  sed 's|^#!/usr/bin/env python|#!/usr/bin/python2|' -i utils/key2pub.py
  patch -p1 -i "${srcdir}"/0001-Makefile-Link-libreg.so-against-the-crypto-library.patch
  patch -p1 -i "${srcdir}"/0001-Makefile-Don-t-run-ldconfig.patch
}

build() {
  cd "${srcdir}"/${_pkgname}
  make
}

package() {
  # Install crda, regdbdump and udev rules
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" UDEV_RULE_DIR=/usr/lib/udev/rules.d/ SBINDIR=/usr/bin/ install
  # Adjust paths in udev rule file
  sed 's|/sbin/crda|/usr/bin/crda|' -i "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules
  # This rule automatically sets the regulatory domain when cfg80211 is loaded
  echo 'ACTION=="add" SUBSYSTEM=="module", DEVPATH=="/module/cfg80211", RUN+="/usr/bin/set-wireless-regdom"' >> "${pkgdir}"/usr/lib/udev/rules.d/85-regulatory.rules

  install -D -m644 "${srcdir}"/${_pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/crda/LICENSE

  install -D -m755 "${srcdir}"/set-wireless-regdom "${pkgdir}"/usr/bin/set-wireless-regdom
}
