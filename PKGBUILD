# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=albion-online-live-game-data-bin
pkgver=1.0.327.93586
pkgrel=1
pkgdesc="The first true cross-platform Sandbox MMO -- game data files for live server"
url="https://albiononline.com/"
arch=('x86_64')
license=('custom')
makedepends=('wget')
depends=('libgl' 'albion-online-launcher-bin')
_URL_PREFIX="https://live.albiononline.com/autoupdate/perfileupdate/linux_${pkgver}"
source=(toc-${pkgver}.xml::"${_URL_PREFIX}/toc_linux.xml" "albion-online-live.desktop")
options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
md5sums=('7e407d44565e513e52110f4293b4d778'
         '0bde53bc71f7d3f5fec295f156a34235')

PKGEXT='.pkg.tar'

read_dom () {
  local IFS=\>
  read -d \< ENTITY CONTENT
  local ret=$?
  TAG_NAME=${ENTITY%% *}
  ATTRIBUTES=${ENTITY#* }
  return $ret
}

parse_dom () {
  if [[ $TAG_NAME = "file" ]] ; then
    eval local ${ATTRIBUTES::-1}
    #echo "$TAG_NAME path is: $path"
    #echo "$TAG_NAME md5 is: $md5"
    echo "Fetching $path..."
    mkdir -p "${srcdir}/opt/albion-online-launcher-bin/game_x64/$(dirname "$path")"
    curl -# -L "${_URL_PREFIX}/${path// /%20}" | bsdtar -xf - -C "${srcdir}/opt/albion-online-launcher-bin/game_x64/$(dirname "$path")"
  fi
}

prepare() {
  msg2 "Fetching game files..."
  while read_dom; do
    parse_dom
  done < "${srcdir}/toc-${pkgver}.xml"
}

package() {
  mv "${srcdir}/opt" "${pkgdir}"

  chmod +x "${pkgdir}/opt/albion-online-launcher-bin/game_x64/Albion-Online"

  mkdir -p "${pkgdir}/usr/bin"
  echo "#!/bin/sh" > "${pkgdir}/usr/bin/albion-online-live"
  echo "LD_PRELOAD=/opt/albion-online-launcher-bin/game_x64/Albion-Online_Data/Plugins/x86_64/libSDL2-2.0.so.0 /opt/albion-online-launcher-bin/game_x64/Albion-Online" >> "${pkgdir}/usr/bin/albion-online-live"
  chmod +x "${pkgdir}/usr/bin/albion-online-live"

  # install .desktop file
  install -m755 -D "${srcdir}/albion-online-live.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:

