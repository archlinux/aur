# Maintainer: Sander Boom <sanderboom@gmail.com>
# Upstream URL Kitematic: https://github.com/kitematic/kitematic
# Upstream URL linux-support: https://github.com/zedtux/kitematic

# Kitematic support for linux is not yet official. This package aims to be a
# quick-and-dirty solution to install and run (providing a *.desktop file) for
# the time being.

pkgname=kitematic
pkgver=0.7.2.r128.ge8e1fba
pkgrel=1
pkgdesc="Visual Docker Container Management"
arch=('x86_64')
url="https://kitematic.com/"
license=('apache')
groups=()
depends=(
  'docker'
  'nodejs'
  'desktop-file-utils'
  'libxtst'
  'alsa-lib'
  'libnotify'
  'gconf'
  'gtk2'
)
makedepends=('git' 'npm')
provides=("${pkgname}")
provides=("${pkgname}")
backup=()
options=()
install="${pkgname}.install"
source=(
  "git+https://github.com/zedtux/${pkgname}#branch=linux-support"
  "${pkgname}.desktop"
  "${pkgname}.svg"
)
noextract=()
sha256sums=(
  'SKIP'
  '7d547df74ed4f0553bf77f28c90f13f9b62eefd75bfa1d4d23da0f1cd2d3ce51'
  '954d9803f49e475bc3242ad8b5dbfe5f3be9b532434ff260e1cf5c929f018617'
)

pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname}"
  npm install electron-prebuilt@^0.27.3
  npm install
  ./node_modules/.bin/grunt release
}

package() {
  cd "${srcdir}"

  # Application
  install -dm755 "${pkgdir}/opt"
  cp -rp "${pkgname}/dist/linux/Kitematic-linux-x64/" "${pkgdir}/opt/"

  # Exec
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/Kitematic-linux-x64/Kitematic" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
