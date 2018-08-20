# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=tbsync
_name_ext=TbSync
pkgname=thunderbird-${_name}
pkgver=0.7.11
pkgrel=1
pkgdesc='Sync contacts, tasks and calendars to thunderbird using Exchange ActiveSync (EAS) and CalDAV/CardDAV'
url='https://github.com/jobisoft/TbSync'
arch=('any')
groups=('office')
license=('GPL3')
depends=('thunderbird>=50' 'thunderbird<61')
conflicts=("${pkgname}-beta")
replaces=("${pkgname}-beta")
makedepends=('zip')
options=('!strip' '!libtool' '!staticlibs' '!docs')
provides=("${_name}=${pkgver}")
source=("${pkgname}-${pkgver}.xpi::${url}/releases/download/v${pkgver}/${_name_ext}-${pkgver}.xpi")
sha256sums=('04ae3b66ce85ea4cd0d78fd3c48a7b8a9f6919897c06c97ee80db6c5faa6a254')

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
