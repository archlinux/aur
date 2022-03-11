_uuid="81210"
_app_id="com.sega.ManxTTSuperBike"
_title="Manx TT SuperBike"
_rom_filename="${_title} (USA)"
pkgname=manx-tt-superbike
pkgver=1.0
pkgrel=2
pkgdesc="1995 arcade racing game developed jointly by Sega AM3 and Sega-AM4."
arch=('any')
url="https://en.wikipedia.org/wiki/Manx_TT_Super_Bike"
depends=('kronos')
makedepends=("p7zip")
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${pkgname}.7z::https://archive.org/download/SegaSaturnChampionCollection/M.zip/Manx%20TT%20SuperBike.7z"
        "saturn-template.desktop"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/b/b2/ManxTTSuperbikeBox.jpg")
sha256sums=("a9b74bcaa89202ae18585547f91579194ba9815308ab3dd6400daa602de74cab"
	    "cddae03b9321eecd3d2db2b23d09494eca063b01ddb3661d9e5a61689a2eba6d"
	    "9e03b0023093232fae99b381b2be1c4408aa77a62fd09a46a3653bb1a5633a54")

prepare() {
  mv saturn-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"
  sed -i "s/%_uuid%/${_uuid}/g" "${_app_id}.desktop"
  sed -i -e "s/${_rom_filename}/${_uuid}/g" "${_rom_filename}.cue"
}

package() {
  local _bin
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"

  for _bin in *; do
    if [[ "${_bin}" == *".bin" || "${_bin}" == *".cue" ]]; then
      _dest=${_bin/$_rom_filename/$_uuid}
      install -Dm644 "${_bin}" "${_game}/${_dest}"
    fi
  done
}
