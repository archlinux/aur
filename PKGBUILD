# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Creator: Javier Vasquez <j dot e dot vasquez dot v at gmail dot com>
_name=exchangecalendar
pkgname=thunderbird-${_name}
pkgver=3.5.0
pkgrel=1
pkgdesc='Thunderbird Addon/Extension and Provider for Microsoft Exchange 2007/2010/2013 Calendar, Tasks, Contacts and Global Address List (GAL)'
url='https://github.com/Ericsson/exchangecalendar'
arch=('any')
groups=('office')
license=('GPL3')
depends=('thunderbird' 'thunderbird-lightning-bin')
makedepends=('zip')
options=('!strip' '!libtool' '!staticlibs' '!docs')
conflicts=('thunderbird-exchangecalendar-git')
provides=("${_name}=${pkgver}")
source=("${pkgname}-${pkgver}.xpi::${url}/releases/download/v${pkgver}/${_name}-v${pkgver}.xpi")
sha256sums=('976a7eee97256c14f143ed3a84d2a46cc7e1341112f699e55aba30d185baf93c')

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
