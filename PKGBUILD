_uuid_it="SCES-02545"
_uuid_es="${_uuid_it}"
_uuid_pt="${_uuid_it}"
_uuid="${_uuid_it}"
_app_id="net.worldwidestudios.MediEvil2"
_title="MediEvil 2"
_rom_filename_it="${_title} (E) (Es,It,Pt)"
pkgbase=medievil-2
pkgname=($pkgbase $pkgbase-it $pkgbase-es $pkgbase-pt)
pkgver=1.0
pkgrel=1
pkgdesc="Action-adventure hack and slash video game developed by SCE Cambridge Studio and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/MediEvil_2"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid_it}.7z::https://archive.org/download/medievil2-portugal-spain-italy-ps1/MediEvil%202%20%28Es%2C%20It%2C%20Pt%29%20%28PS1%29.7z"
	"${_uuid_it}.sbi.7z::https://psxdatacenter.com/sbifiles/MediEvil%202%20(S)(I)(P)%20[SCES-02545]%20sbi.7z"
        "psx-template.desktop"
	"launcher"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/f/f2/MediEvil_2_Cover.jpg")
sha256sums=("9741f923a8581ffeb4b2bffe1ee4f95bc1bfb7636040915c4889e9fde02cbe3f"
	    "396cf29bb413f5f537a5446c6b29898907b64875dfb658f1358ebbd18da18f40"
	    "517b82624fe3f0ea13ca4f9eea1e11088e30ff8449ae69f37b7a1412744c734d"
	    "243e129901670aafd6c10384ba334af7ea7a2d8d7686ab94c50595318bec0a02"
	    "64beb960bff7c8b2e58d731d84053d2b36bf98a41fa0d0781ef37c1a271bae97")

prepare() {
  mv "${_rom_filename_it}.bin" "${_uuid_it}.bin"
  mv "${_rom_filename_it}.cue" "${_uuid_it}.cue"
  cp psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"

  cp launcher "${pkgbase}"
  sed -i "s/%_app_id%/${_app_id}/g" "${pkgbase}"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${pkgbase}"

  echo "/usr/games/${_app_id}/${_uuid}.cue" > any
  sed -i -e "s/${_rom_filename_it}/${_uuid_it}/g" "${_uuid_it}.cue"
}

_package(){
  local _uuid="${1}"
  local _lang="${2}"
  local _game="${pkgdir}/usr/games/${_app_id}"
  install -Dm644 "${_uuid}.bin" "${_game}/${_uuid}.bin"
  install -Dm644 "${_uuid}.cue" "${_game}/${_uuid}.cue"
  install -Dm644 "${_uuid}.sbi" "${_game}/${_uuid}.sbi" || true
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${_game}/${_lang}"
}

package_medievil-2() {
  install -Dm644 any "${pkgdir}/usr/games/${_app_id}/any"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

package_medievil-2-it() {
  depends+=($pkgbase)
  local _lang="it"
  local _uuid="${_uuid_it}"
  mv "SCES_025.45.sbi" "${_uuid}.sbi"
  _package "${_uuid}" "${_lang}"
}

package_medievil-2-es() {
  depends=("${pkgbase}-it")
  local _lang="es"
  local _uuid="${_uuid_es}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_medievil-2-pt() {
  depends=("${pkgbase}-it")
  local _lang="pt"
  local _uuid="${_uuid_pt}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}
