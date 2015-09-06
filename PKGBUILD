# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: M.Carreira <arch@carreira.com.pt>

set -u
pkgname='raider'
pkgver='0.13.2'
pkgrel='1'
pkgdesc='Converts a single linux system disk in to a software raid 1, 4, 5, 6 or 10'
arch=('any')
url='http://raider.sourceforge.net/'
license=('GPL2')
depends=('mdadm>=2.6' 'parted>=2.0' 'bash>=3.0' 'coreutils' 'util-linux' 'hdparm' 'rsync' 'inetutils' 'bc' 'wget')
install="${pkgname}.install"
changelog='ChangeLog'
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b5a726c44be96e3834c42f8b6df4031f23720f0f39693be45c47f4f15d3244dd')

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dpm755 'src/lib'/* -t "${pkgdir}/usr/lib/raider/"
  install -Dpm755 'src/bin'/* -t "${pkgdir}/usr/bin/"
  sed -i -e 's:^#!/bin/bash$:#!/usr/bin/bash:g' "${pkgdir}/usr/lib/raider"/* "${pkgdir}/usr/bin"/*
  sed -i -e 's: /bin/bash: /usr/bin/bash:g' "${pkgdir}/usr/lib/raider/step2"
  install -d "${pkgdir}/var/lib/raider"
  install -dm777 "${pkgdir}/var/log/raider"
  install -Dpm644 'AUTHORS' 'COPYING' 'ChangeLog' 'FAQ' 'INSTALL' 'README' 'TODO' -t "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"
  set +u
  # Ensure there are no forbidden paths. Place at the end of package() and comment out as you find or need exceptions. (git-aurcheck)
  ! test -d "${pkgdir}/bin" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
  ! test -d "${pkgdir}/sbin" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! test -d "${pkgdir}/lib" || { echo "Line ${LINENO} Forbidden: /lib"; false; }
  ! test -d "${pkgdir}/share" || { echo "Line ${LINENO} Forbidden: /share"; false; }
  ! test -d "${pkgdir}/usr/sbin" || { echo "Line ${LINENO} Forbidden: /usr/sbin"; false; }
  ! test -d "${pkgdir}/usr/local" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  # Only in ChangeLog
  #! grep -lr "/sbin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /sbin"; false; }
  ! grep -lr "/usr/tmp" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/tmp"; false; }
  ! grep -lr "/usr/local" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /usr/local"; false; }
  ! pcre2grep -Ilr "(?<!/usr)/bin" "${pkgdir}" || { echo "Line ${LINENO} Forbidden: /bin"; false; }
}
set +u

# vim:set ts=2 sw=2 et:
