# Maintainer: Vladyslav Aviedov <vladaviedov at protonmail dot com>
# Contributor: Jacob Still <jacobcstill at gmail dot com>
pkgname=focalboard-server-git
pkgver=r3592.3b7954872
pkgrel=1
epoch=
pkgdesc="Focalboard is an open source, self-hosted alternative to Trello, Notion, and Asana."
arch=('i686' 'x86_64')
url="https://www.focalboard.com/"
license=('MIT')
groups=()
depends=()
makedepends=('go>=1.18' 'nodejs>=10.0' 'npm' 'git')
checkdepends=()
optdepends=()
provides=('focalboard-server')
conflicts=('focalboard-server')
replaces=()
backup=()
options=()
install=focalboard.install
changelog=
source=("${pkgname}::git+https://github.com/mattermost/focalboard.git"
        'focalboard.service')
noextract=()
sha256sums=('SKIP'
            '607d16cb2544101d0e4291e7804c3137b90b620107a37431c0f3d71e93c4fcd5')
validpgpkeys=()

build() {
  cd "${srcdir}/${pkgname}"
  LDFLAGS=''
  make prebuild
  make server-linux webapp
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  PACKAGE_FOLDER="$pkgdir/opt/focalboard/"
  mkdir -p "${PACKAGE_FOLDER}" "${PACKAGE_FOLDER}/bin" "${PACKAGE_FOLDER}/pack" "${PACKAGE_FOLDER}/license"

  # Copy focalboard build
  cp bin/linux/focalboard-server "${PACKAGE_FOLDER}/bin"
  cp -r webapp/pack/* "${PACKAGE_FOLDER}/pack"
  cp config.json "${PACKAGE_FOLDER}"
  cp NOTICE.txt "${PACKAGE_FOLDER}/license"
  cp webapp/NOTICE.txt "${PACKAGE_FOLDER}/license/webapp-NOTICE"

  # Systemd Service
  mkdir -p "${pkgdir}/usr/lib/systemd/system/"
  cp "${srcdir}/focalboard.service" "${pkgdir}/usr/lib/systemd/system/focalboard.service"
}
