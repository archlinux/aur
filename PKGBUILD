# Maintainer: Jacob Still <jacobcstill at gmail dot com>
pkgname=focalboard-server
pkgver=7.1.0
pkgrel=3
epoch=
pkgdesc="Focalboard is an open source, self-hosted alternative to Trello, Notion, and Asana."
arch=('i686' 'x86_64')
url="https://www.focalboard.com/"
license=('MIT')
groups=()
depends=()
makedepends=('go>=1.18' 'nodejs>=16.3' 'npm')
checkdepends=()
optdepends=()
provides=('focalboard-server')
conflicts=('focalboard-server')
replaces=()
backup=(opt/focalboard-${pkgver}-${pkgrel}/config.json)
options=()
install=focalboard.install
changelog=
source=("${pkgname}::git+https://github.com/mattermost/focalboard.git#tag=v${pkgver}"
        'focalboard.service')
noextract=()
sha256sums=('SKIP'
            '8b3037f093de8610ff50aff2aba3c31e137af0067fda508291a1abfbdd4c72b1')
validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname}"
  LDFLAGS=''
  make prebuild
  make server-linux webapp
}

package() {
  cd "${srcdir}/${pkgname}"
  PACKAGE_FOLDER="$pkgdir/opt/focalboard-${pkgver}-${pkgrel}/"
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

