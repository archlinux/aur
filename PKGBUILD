# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Category: system

# Recommended build & install command: makepkg -scCfi

set -u
pkgname='oki-b411-b431'
_pkgnick='MB400PCL'
pkgver='5.0.0'
pkgrel=1
pkgdesc='cups driver for the Okidata B411 and B431'
url='http://www.okidata.com/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('cups')
# install="${pkgname}.install"
# An install is not necessary. Printers appear and disappear from cups
# without a systemctl reload org.cups.cupsd.service or killall -HUP cupsd
source=('ftp://ftp2.okidata.com/pub/drivers/linux/SFP/monochrome/desktop/MB400PCLv5.tar')
sha256sums=('3ab2df56a62e03d0c0f8dcbb09ea7cde757eac3eb9ab1772f5f3c421cbb6c73f')

prepare() {
  set -u
  #cd "${pkgname}-${pkgver}"
  cd "${_pkgnick}"
  # There's 101 ways to hack up this installer. I choose to
  # fix it the way it should be for most package makers.
  chmod 755 install.sh
  sed -i -e 's:^\(_CUPS[A-Z]*="\):# \1:g' \
         -e 's:PATH="\(/usr/\):PATH="${DESTDIR}\1:g' \
         -e 's:^\(for i in \${_CUPS}\):if [ "${DESTDIR}" != "" ]; then\n\texit 0\nfi\n\n\1:g' \
         -e 's:\(\${CHOWN}\):# \1:g' \
         -e 's:\(\${CHGRP}\):true # \1:g' \
         -e 's:^\(PATH=/\):# \1:g' \
         -e 's:^\(export PATH\):# \1:g' \
         -e 's:^if \[ \(`${ID} -u`\):if \[ "${DESTDIR}" = "" -a \1:g' 'install.sh'
  set +u
}

package() {
  set -u
  cd "${_pkgnick}"
  install -d "${pkgdir}/usr/share/cups/model"
  install -d "${pkgdir}/usr/lib/cups/filter"
  sh -c "export DESTDIR='${pkgdir}'; ./install.sh"
  set +u
}
set +u
