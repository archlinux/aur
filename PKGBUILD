# Maintainer: Jacob Still <jacobcstill at gmail dot com>

pkgname=focalboard-server-git
pkgver=0.15.0
pkgrel=1
pkgdesc="Focalboard is an open source, self-hosted alternative to Trello, Notion, and Asana."
arch=('i686' 'x86_64')
url="https://www.focalboard.com/"
license=('MIT')
provides=('focalboard-server')
conflicts=('focalboard-server')
makedepends=('go>=1.15' 'nodejs>=16.3' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mattermost/focalboard/archive/refs/tags/v$pkgver.tar.gz"
        'focalboard.service')
sha256sums=('SKIP'
            '8b3037f093de8610ff50aff2aba3c31e137af0067fda508291a1abfbdd4c72b1')

build() {
  cd "${srcdir}/focalboard-${pkgver}"
  LDFLAGS=''
  make prebuild
  make server-linux webapp
}

package() {
  cd "${srcdir}/focalboard-${pkgver}"
  PACKAGE_FOLDER="$pkgdir/opt/focalboard/"
  mkdir -pv "${PACKAGE_FOLDER}/" "${PACKAGE_FOLDER}/bin/" "${PACKAGE_FOLDER}/pack/"
  cp -v bin/linux/focalboard-server "${PACKAGE_FOLDER}/bin/"
  cp -vr webapp/pack "${PACKAGE_FOLDER}/"
  cp -v server-config.json "${PACKAGE_FOLDER}/config.json"
  cp -v build/MIT-COMPILED-LICENSE.md "${PACKAGE_FOLDER}/MIT-COMPILED-LICENSE.md"
  cp -v NOTICE.txt "${PACKAGE_FOLDER}/NOTICE.txt"
  cp -v webapp/NOTICE.txt "${PACKAGE_FOLDER}/webapp-NOTICE.txt"
  mkdir -pv "${pkgdir}/usr/lib/systemd/system/"
  cp -v "${srcdir}/focalboard.service" "${pkgdir}/usr/lib/systemd/system/focalboard.service"
}

