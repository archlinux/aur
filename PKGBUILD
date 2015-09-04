# Maintainer: Javier Tia <javier dot tia at gmail dot com>
# Creator: Javier Vasquez <j dot e dot vasquez dot v at gmail dot com>
pkgname=thunderbird-exchangecalendar
pkgver=3.4.0.rc1
_pkgver=3.4.0-rc1
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
sha256sums=('bd87f4e5d6fd2ade107750a30a7469a92527e22d54c08e3a40f99ce2c57f92e6')
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

  # Extract extension name
  _emid=$(grep -m 1 em:id ${srcdir}/${_name}-${_pkgver}/install.rdf \
    | sed 's/.*>\(.*\)<.*/\1/')

  # Thunderbird extensions directory path
  _pkgsrc=usr/lib/thunderbird/extensions

  # Create thunderbird extensions directory with another emid directory
  # extension name
  mkdir -p ${pkgdir}/${_pkgsrc}/${_emid}

  # Work under thunderbird extensions directory
  cd ${pkgdir}/${_pkgsrc}

  # Extract all files from .xpi file in emid directory
  bsdtar -x --cd ${_emid} \
    -f ${srcdir}/${_name}-${_pkgver}/${_name}-${_emver}.xpi

  # Fix permissions in emid extension directory
  find ${_emid} -type d -exec chmod 0755 \{\} \+
  find ${_emid} -type f -exec chmod 0644 \{\} \+
  find ${_emid} -name '*.so' -exec chmod 0755 \{\} \+
  chown -R root:root ${_emid}
}

# vim:set ft=sh ts=2 sw=2 ft=sh et:
