# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Joel Goguen <jgoguen (at-sign) jgoguen (period) ca>

pkgname=thunderbird-lightning-bin
pkgver=3.3
pkgrel=1
pkgdesc="A calendar that's fully integrated into Thunderbird."
arch=('i686' 'x86_64')
url="https://www.mozilla.org/en-US/projects/calendar/"
license=('MPL' 'GPL' 'LGPL')
depends=('thunderbird>=31' 'libnotify')
makedepends=()
options=(!strip)
provides=(lightning=${pkgver})
replaces=("lightning-bin")
conflicts=("lightning-bin")
source=(lightning-$pkgver.xpi::https://ftp.mozilla.org/pub/mozilla.org/calendar/lightning/releases/${pkgver}/linux/lightning.xpi)
sha1sums=('ec57e16d37af32ac4f0051fdbc21c9e592f2a36e')

package() {
  mkdir -p ${pkgdir}/usr/lib/thunderbird/extensions/${pkgname}
  cd ${pkgdir}/usr/lib/thunderbird/extensions/${pkgname}
  bsdtar -x -f ${srcdir}/lightning-$pkgver.xpi

  _emid=$(grep em:id install.rdf | tail -n 1 | sed 's/.*>\(.*\)<.*/\1/')
  cd ../
  mv ${pkgname} ${_emid}
  cd ${_emid}

  # Fix permissions
  find -type d -exec chmod 0755 \{\} \+
  find -type f -exec chmod 0644 \{\} \+
  find -name '*.so' -exec chmod 0755 \{\} \+
  chown -R root:root .
}
