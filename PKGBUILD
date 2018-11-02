# Maintainer: Michael Wyraz <michael dot wyraz dot de>

_name=exchangecalendar
pkgname=thunderbird-${_name}-alpha
_verbeta=alpha1
_vermin=5.0
_ver=${_vermin}.0
pkgver=${_ver}_${_verbeta}
pkgrel=0
pkgdesc='Thunderbird Addon/Extension and Provider for Microsoft Exchange 2007/2010/2013 Calendar, Tasks, Contacts and Global Address List (GAL)'
url='https://github.com/ExchangeCalendar/exchangecalendar'
arch=('any')
groups=('office')
license=('GPL3')
depends=('thunderbird>=60' 'thunderbird<61')
makedepends=('zip')
options=('!strip' '!libtool' '!staticlibs' '!docs')
conflicts=('thunderbird-exchangecalendar-git' 'thunderbird-exchangecalendar' 'thunderbird-exchangecalendar-beta')
provides=("${_name}=${pkgver}")
source=("${pkgname}-${pkgver}.xpi::${url}/releases/download/v${_ver}-${_verbeta}/${_name}-v${_ver}-${_verbeta}.xpi")
sha256sums=('bc92e97afdc80814090c28b569ed4a4d77c8bbbfcebe4462c7492f9269fa2e0a')

package() {
  _extdir=usr/lib/thunderbird/extensions
  mkdir -p ${pkgdir}/${_extdir}/${pkgname}
  cd ${pkgdir}/${_extdir}/${pkgname}
  bsdtar -x -f ${srcdir}/${pkgname}-${pkgver}.xpi

  # Extract extension name
  _emid=$(grep -m 1 em:id install.rdf | sed 's/.*>\(.*\)<.*/\1/')

  # Change extension name
  cd ..
  mv ${pkgname} ${_emid}
  cd ${_emid}

  # Disable warn and check about new version
  sed -i 's|\(warnAboutNewAddOnVersion", \)true|\1false|' \
    defaults/preferences/update_disable.txt
  sed -i 's|\(checkForNewAddOnVersion", \)true|\1false|' \
    defaults/preferences/update_disable.txt
  cat defaults/preferences/update_disable.txt > defaults/preferences/update.js

  # Fix permissions in emid extension directory
  find . -type d -exec chmod 0755 \{\} \+
  find . -type f -exec chmod 0644 \{\} \+
  chown -R root:root .
}

# vim:set ft=sh ts=2 sw=2 ft=sh et:
