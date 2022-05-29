_uuid_it="SCES-01494"
_uuid_jp="SCPS-10081"
_uuid=$_uuid_it
_app_id="net.worldwidestudios.MediEvil"
_title="MediEvil"
_rom_filename_it="medievil.img"
_rom_filename_jp="MediEvil J.BIN"
pkgbase=medievil
pkgname=($pkgbase $pkgbase-it $pkgbase-jp)
pkgver=1.0
pkgrel=1
pkgdesc="Action-adventure hack and slash video game developed by SCE Cambridge Studio and published by Sony Computer Entertainment for the PlayStation."
arch=('any')
url="https://en.wikipedia.org/wiki/MediEvil"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid_it}.bin::https://archive.org/download/medievil/medievil.img"
	"${_uuid_it}.cue::https://archive.org/download/medievil/medievil.cue"
	"${_uuid_it}.7z::https://psxdatacenter.com/sbifiles/MediEvil%20(I)%20[SCES-01494]%20sbi.7z"
	"${_uuid_jp}.bin::https://archive.org/download/medievilscps10081/MediEvil%20%5BSCPS-10081%5D.zip/MediEvil%20J.BIN"

	"${_uuid_jp}.cue::https://archive.org/download/medievilscps10081/MediEvil%20%5BSCPS-10081%5D.zip/MediEvil%20J.cue"
        "psx-template.desktop"
	"launcher"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/d/d3/Medievil_cover.jpg")
sha256sums=("a722bc37862876eb53415b15ad2977a69487413f9241186c373ae8dc9917c007"
	    "9eaeb95180371439af2bbc4ab77a57cf09656c0360b174ae85b32fbef81ed078"
	    "6963af08246ae0dee61c562b2fe9c052c22e3524062bb083698df51fbd5aa06e"
	    "2ecfd848609645e9eccf0dd28a540149c6ba27af3a2d577630b817aa246225db"
	    "b9cb2d0f1717de3e7b8096a5189eca9efb7792f287b3ce5fbb40ca789777f9d8"
	    "517b82624fe3f0ea13ca4f9eea1e11088e30ff8449ae69f37b7a1412744c734d"
	    "243e129901670aafd6c10384ba334af7ea7a2d8d7686ab94c50595318bec0a02"
	    "dd9019e1daaa6badd13588dda4b9d00d3d5147a09e5635bc97fdc962ccddf83d")

prepare() {
  cp psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"

  cp launcher "${pkgbase}"
  sed -i "s/%_app_id%/${_app_id}/g" "${pkgbase}"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${pkgbase}"

  echo "/usr/games/${_app_id}/${_uuid}.cue" > any
  sed -i -e "s/${_rom_filename_it}/${_uuid_it}.bin/g" "${_uuid_it}.cue"
  sed -i -e "s/${_rom_filename_jp}/${_uuid_jp}.bin/g" "${_uuid_jp}.cue"
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

package_medievil() {
  install -Dm644 any "${pkgdir}/usr/games/${_app_id}/any"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

package_medievil-it() {
  depends+=($pkgbase)
  local _lang="it"
  local _uuid="${_uuid_it}"
  mv "SCES_014.94.sbi" "${_uuid}.sbi"
  _package "${_uuid}" "${_lang}"
}

package_medievil-jp() {
  depends+=($pkgbase)
  local _lang="jp"
  local _uuid="${_uuid_jp}"
  _package "${_uuid}" "${_lang}"
}
