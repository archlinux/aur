# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Creator: Javier Vasquez <j dot e dot vasquez dot v at gmail dot com>
pkgname=thunderbird-exchangecalendar
pkgver=3.4.0.beta5
_pkgver=3.4.0-beta5
pkgrel=1
pkgdesc="Thunderbird Addon/Extension and Provider for Microsoft Exchange 2007/2010/2013 Calendar, Tasks, Contacts and Global Address List (GAL)."
url="https://github.com/Ericsson/exchangecalendar"
arch=('any')
license=('GPL3')
depends=('thunderbird' 'thunderbird-lightning-bin')
makedepends=('zip')
options=('!strip' '!libtool' '!staticlibs' '!docs')
conflicts=('thunderbird-exchangecalendar-git')
provides=('thunderbird-exchangecalendar')
source=(https://github.com/Ericsson/exchangecalendar/archive/${_pkgver}.tar.gz)
sha256sums=('032739bac7f4d1295e5ffe462ef6fa2c4440604193094923e3d7c8757f8e225c')
_name=exchangecalendar

build() {
  cd ${srcdir}/${_name}-${_pkgver}

  # Allow warnings of new packages, though do not make it required
  sed -i 's|\(warnAboutNewAddOnVersion", \)false|\1true|' defaults/preferences/update_disable.txt
  sed -i 's|\(checkForNewAddOnVersion", \)false|\1true|' defaults/preferences/update_disable.txt

  ./build.sh -d
}

package() {
  # Extract extension version
  _emver=$(grep -m 1 em:version ${srcdir}/${_name}-${_pkgver}/install.rdf \
    | sed 's/.*>\(.*\)<.*/\1/')

  # Extract all files from extension .xpi file
  _pkgsrc=usr/lib/thunderbird/extensions
  mkdir -p ${pkgdir}/${_pkgsrc}/${pkgname}-${pkgver}
  bsdtar -x --cd ${pkgdir}/${_pkgsrc}/${pkgname}-${pkgver} \
    -f ${srcdir}/${_name}-${_pkgver}/${_name}-${_emver}.xpi

  # Extract extension name
  _emid=$(grep -m 1 em:id ${srcdir}/${_name}-${_pkgver}/install.rdf \
    | sed 's/.*>\(.*\)<.*/\1/')
   mv ${srcdir}/${_name}-${_pkgver} ${_emid}

  # Fix permissions in extension directory
  find ${_emid} -type d -exec chmod 0755 \{\} \+
  find ${_emid} -type f -exec chmod 0644 \{\} \+
  find ${_emid} -name '*.so' -exec chmod 0755 \{\} \+
  chown -R root:root ${_emid}
}

# vim:set ft=sh ts=2 sw=2 ft=sh et:
