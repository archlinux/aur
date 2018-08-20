# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=tbsync
_name_ext=TbSync
pkgname=thunderbird-${_name}-beta
_ver=0.7.10
pkgver=0.7.10.26
pkgrel=2
pkgdesc='Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV'
url='https://github.com/jobisoft/TbSync'
arch=('any')
groups=('office')
license=('GPL3')
depends=('thunderbird>=50' 'thunderbird<61')
makedepends=('zip')
conflicts=("thunderbird-${_name}")
replaces=("thunderbird-${_name}")
options=('!strip' '!libtool' '!staticlibs' '!docs')
provides=("${_name}=${pkgver}")
source=("${pkgname}-${pkgver}.xpi::${url}/releases/download/v${_ver}/${_name_ext}-beta.xpi")
sha256sums=('9e10dc88d87b33161af0789e9825b8d4bcccb4c5211dfe86c5e31c8c66f8fd52')

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

  # Fix permissions in emid extension directory
  find . -type d -exec chmod 0755 \{\} \+
  find . -type f -exec chmod 0644 \{\} \+
  chown -R root:root .
}

# vim:set ft=sh ts=2 sw=2 ft=sh et:
