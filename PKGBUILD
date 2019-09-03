# Maintainer: Javier Tiá <javier dot tia at gmail dot com>
# Creator: Javier Vasquez <j dot e dot vasquez dot v at gmail dot com>

_name=exchangecalendar
pkgname=thunderbird-${_name}-beta
_verbeta=beta1
_vermin=5.0
_ver=${_vermin}.0
pkgver=${_ver}_${_verbeta}
pkgrel=1
pkgdesc='Thunderbird Addon/Extension and Provider for Microsoft Exchange 2007/2010/2013 Calendar, Tasks, Contacts and Global Address List (GAL)'
url='https://github.com/ExchangeCalendar/exchangecalendar'
arch=('any')
groups=('office')
license=('GPL3')
depends=('thunderbird<61.0.0')
makedepends=('zip')
options=('!strip' '!libtool' '!staticlibs' '!docs')
conflicts=('thunderbird-exchangecalendar-git' 'thunderbird-exchangecalendar')
replaces=('thunderbird-exchangecalendar-git' 'thunderbird-exchangecalendar')
provides=("${_name}=${pkgver}")
source=("${pkgname}-${pkgver}.xpi::${url}/releases/download/v${_ver}-${_verbeta}/${_name}-v${_ver}-${_verbeta}.xpi")
sha256sums=('059ed06b0d1bfcf3ff425543f3abbcf0f453b9fb32bd14e04602d7f82ff7d06d')

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

# vim:set ts=2 sw=2 et:
