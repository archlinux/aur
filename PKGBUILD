# Maintainer: Raimar Bühmann <raimar (at-sign) buehmann (period) de>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Joel Goguen <jgoguen (at-sign) jgoguen (period) ca>

pkgname=thunderbird-lightning-bin
pkgver=4.0.1
pkgrel=2
pkgdesc="A calendar that's fully integrated into Thunderbird."
arch=('i686' 'x86_64')
groups=('office')
url="https://www.mozilla.org/en-US/projects/calendar/"
license=('MPL' 'GPL' 'LGPL')
depends=('thunderbird>=38' 'libnotify')
makedepends=()
options=(!strip)
provides=(lightning=${pkgver})
replaces=("lightning-bin")
conflicts=("lightning-bin")
# https://addons.mozilla.org/de/thunderbird/addon/lightning/versions/
source=(lightning-$pkgver.xpi::https://addons.mozilla.org/thunderbird/downloads/file/327914/lightning-${pkgver}-sm+tb-linux.xpi)
sha1sums=('9a5fa7d91482c322d26a4cd469b3ccaaf7b9f9b3')

package() {
  mkdir -p ${pkgdir}/usr/lib/thunderbird/extensions/${pkgname}
  cd ${pkgdir}/usr/lib/thunderbird/extensions/${pkgname}
  bsdtar -x -f ${srcdir}/lightning-$pkgver.xpi

  _emid=$(grep em:id install.rdf | tail -n 1 | sed 's/.*>\(.*\)<.*/\1/')
  cd ..
  mv ${pkgname} ${_emid}
  cd ${_emid}
  # fix minimum version
  sed -i 's/<em:minVersion>38.0</<em:minVersion>38.0.0</' install.rdf

  # Fix permissions
  find -type d -exec chmod 0755 \{\} \+
  find -type f -exec chmod 0644 \{\} \+
  find -name '*.so' -exec chmod 0755 \{\} \+
  chown -R root:root .
}
