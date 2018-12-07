# Maintainer: Michael Wyraz <michael dot wyraz dot de>

_name=exchangecalendar
pkgname=thunderbird-${_name}-alpha
_veralpha=alpha2
_vermin=5.0
_ver=${_vermin}.0
pkgver=${_ver}_${_veralpha}
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
source=("${pkgname}-${pkgver}.xpi::${url}/releases/download/v${_ver}-${_veralpha}/${_name}-v${_ver}-${_veralpha}.xpi")
sha256sums=('df33fb2305ab85d70e7d3f5b95ba8965be8e8813ff99d54eab40c7b7057c9cdd')

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
