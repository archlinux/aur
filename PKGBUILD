# Maintainer: Your Name <you@example.com>
pkgname=azerothcore-clientdata
_pkgname=azerothcore-wotlk
pkgver=20.0
pkgrel=1
pkgdesc="Pre-extracted client map data assets for AzerothCore"
arch=('any')
url="https://www.azerothcore.org"
license=('AGPL3')
depends=('azerothcore-wotlk-git')
makedepends=('unzip')
options=(!strip !debug)
source=('Data.zip::https://github.com/wowgaming/client-data/releases/download/v${pkgver}/Data.zip')
sha256sums=('a3d4df635ae6c2c8f08052c32a79e0f806955150ad36b014a823dd08a32a4610')

prepare() {
  mkdir -p "${srcdir}/runtime_assets"
  unzip -q -o "${srcdir}/Data.zip" -d "${srcdir}/runtime_assets"
}

build() {
  :
}

package() {
  local tmp_download="${srcdir}/runtime_assets"
  local pkgdata="${pkgdir}/usr/share/azerothcore/data"

  install -d "${pkgdata}"

  echo " -> Extracted client data available in ${tmp_download}"

  local target_src=""
  if [ -d "${tmp_download}/Data" ]; then
    target_src="${tmp_download}/Data"
  elif [ -d "${tmp_download}/data" ]; then
    target_src="${tmp_download}/data"
  else
    target_src="${tmp_download}"
  fi

  install -d "${pkgdata}/Cameras"
  cp -fr "${target_src}/"[Cc]ameras/. "${pkgdata}/Cameras/"

  install -d "${pkgdata}/dbc"
  cp -fr "${target_src}/"[Dd][Bb][Cc]/. "${pkgdata}/dbc/"

  install -d "${pkgdata}/maps"
  cp -fr "${target_src}/"[Mm]aps/. "${pkgdata}/maps/"

  install -d "${pkgdata}/mmaps"
  cp -fr "${target_src}/"[Mm][Mm]aps/. "${pkgdata}/mmaps/"

  install -d "${pkgdata}/vmaps"
  cp -fr "${target_src}/"[Vv][Mm]aps/. "${pkgdata}/vmaps/"
}