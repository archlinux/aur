# Maintainer: djazz

pkgname=legends-of-equestria
pkgver=latest
pkgrel=5
pkgdesc="A free 3D MMORPG/Adventure game"
arch=('i686' 'x86_64')
url="https://www.legendsofequestria.com/"
license=('unknown')
makedepends=('nodejs' 'yarn')
options=(strip)
source=(
  loe-fetch.js package.json
  launch.sh icon.png legends-of-equestria.desktop
)
sha256sums=(
  'SKIP' 'SKIP'
  'SKIP' 'SKIP' 'SKIP'
)

PKGEXT='.pkg.tar'

package() {
  export YARN_CACHE_FOLDER="${srcdir}/yarn-cache"

  cp --remove-destination "$(readlink "${srcdir}/package.json")" "${srcdir}/package.json"
  cp --remove-destination "$(readlink "${srcdir}/loe-fetch.js")" "${srcdir}/loe-fetch.js"

  echo "Installing dependencies..."
  yarn install --non-interactive --no-lockfile --ignore-engines

  echo "Downloading Legends of Equestria..."
  node ./loe-fetch

  install -d "${pkgdir}/opt/${pkgname}"
  mv dl/loe "${pkgdir}/opt/${pkgname}/"

  install -D "${srcdir}/legends-of-equestria.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -D "${srcdir}/launch.sh" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
