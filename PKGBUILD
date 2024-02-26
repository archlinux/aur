# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Truocolo <truocolo@aol.com>

_7z=false
_uuid="T-4801H-50"
_app_id="com.sega.VirtuaRacing"
_title="Virtua Racing"
_rom_filename="${_title} (USA) (15S)"
pkgname=virtua-racing
pkgver=1.0
pkgrel=3
pkgdesc="Racing game, published by TIME WARNER INTERACTIVE, which was released in Europe in 1995 for the Sega Saturn."
arch=(
  'any'
)
url="https://en.wikipedia.org/wiki/Virtua_Racing"
depends=(
  'kronos'
)
makedepends=()
source=()
sha256sums=()
_archive="https://archive.org/download"
[[ "${_7z}" == true ]] && \
  makedepends=(
    "p7zip"
  ) && \
  source+=(
    "${pkgname}.7z::${_archive}/download/SegaSaturnChampionCollection/V.zip/Virtua%20Racing.7z"
  ) && \
  sha256sums+=(
    "0ddf863a7e3c0cef646a06543ca82b02dc1435336d7f4436d79fb52d873255c7"
  )
[[ "${_7z}" == false ]] && \
  source+=(
    "${pkgname}.zip::https://archive.org/download/sega-saturn-champion-collection-updated/V/Virtua%20Racing%20%28NA%29.zip"
  ) && \
  sha256sums+=(
    "SKIP"
  )
license=(
  "custom"
)
_dmca_exemption="https://archive.org/about/dmca.php"
source+=(
  "saturn-template.desktop"
  "${_app_id}.png"
)
sha256sums+=(
  "cddae03b9321eecd3d2db2b23d09494eca063b01ddb3661d9e5a61689a2eba6d"
  "3ac6338d2c974c39b0a5b0df450bb46d55af336ad719b237fcb61a0b2309f4a1"
)

prepare() {
  mv \
    saturn-template.desktop "${_app_id}.desktop"
  sed \
    -i \
    "s/%_title%/${_title}/g" \
    "${_app_id}.desktop"
  sed \
    -i \
    "s/%pkgdesc%/${pkgdesc}/g" \
    "${_app_id}.desktop"
  sed \
    -i \
    "s/%_app_id%/${_app_id}/g" \
    "${_app_id}.desktop"
  sed \
    -i \
    "s/%_uuid%/${_uuid}/g" \
    "${_app_id}.desktop"
  sed \
    -i \
    -e \
    "s/${_rom_filename}/${_uuid}/g" \
    "${_rom_filename}.cue"
}

package() {
  local \
    _bin \
    _game="${pkgdir}/usr/games/${_app_id}"
  install \
    -Dm755 \
    "${_app_id}.desktop" \
    "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install \
    -Dm644 \
    "${_app_id}.png" \
    "${pkgdir}/usr/share/icons/${_app_id}.png"

  for _bin in *; do
    if \
      [[ "${_bin}" == *".bin" ]] || \
      [[ "${_bin}" == *".cue" ]]; then
      _dest=${_bin/$_rom_filename/$_uuid}
      install \
        -Dm644 \
	"${_bin}" \
	"${_game}/${_dest}"
    fi
  done
}

# vim:set sw=2 sts=-1 et:
