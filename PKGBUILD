_uuid_en="SCUS-94900"
_uuid_it="SCES-00344"
_uuid_de="${_uuid_it}"
_uuid_es="${_uuid_it}"
_uuid_fr="${_uuid_it}"
_uuid_jp="SCPS-10031"
_uuid=$_uuid_it
_app_id="com.naughtydog.CrashBandicoot"
_title="Crash Bandicoot"
_rom_filename_it="${_title} (Europe) (EDC)"
_rom_filename_en="${_title} (USA)"
_rom_filename_jp="${_title} (Japan)"
pkgbase=crash-bandicoot
pkgname=($pkgbase
         $pkgbase-de
         $pkgbase-en
         $pkgbase-es
         $pkgbase-fr
         $pkgbase-it
         $pkgbase-jp)
pkgver=1.0
pkgrel=5
_pkgdesc=("1996 platform video game developed by Naughty Dog"
          " and published by Sony Computer Entertainment for the PlayStation.")
pkgdesc="${_pkgdesc[*]}"
arch=('any')
url="https://en.wikipedia.org/wiki/Crash_Bandicoot_(video_game)"
depends=('duckstation')
license=("custom")
_dmca_exemption="https://archive.org/about/dmca.php"
source=("${_uuid_en}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%20%28USA%29.zip/Crash%20Bandicoot%20%28USA%29.bin"
        "${_uuid_en}.cue::https://archive.org/download/redump.psx/Crash%20Bandicoot%20%28USA%29.zip/Crash%20Bandicoot%20%28USA%29.cue"
        "${_uuid_it}.bin::https://archive.org/download/redump.psx/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.zip/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.bin"
        "${_uuid_it}.cue::https://archive.org/download/redump.psx/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.zip/Crash%20Bandicoot%20%28Europe%29%20%28EDC%29.cue"
        "${_uuid_jp}.7z::https://archive.org/download/sonyplaystationasiantscj20151103/Crash%20Bandicoot%20%28Japan%29.7z"
        "psx-template.desktop"
	"launcher"
        "${_app_id}.png::https://upload.wikimedia.org/wikipedia/en/4/44/Crash_Bandicoot_Cover.png")
sha256sums=("35d4b837108adc4c5313a45c0f203aa76bc0911873204e908512187379eb98ec"
	    "25b0c6fa83c3ad867684f551e769ce721fd81c23649b3fd389ad3f1a2ececbdb"
	    "a086b6fdd8d908393ff8a7e29be1e7add7cc0a495a221f526c6aa0e784329a54"
	    "866e0e0e9450d605b2b906a069ec74e2d51131fbd65f13d03462943f685bd51e"
	    "f799a6bd213d9fc78adc277197570bfa0f0bac7103d12ec723f935e86e0a4897"
	    "517b82624fe3f0ea13ca4f9eea1e11088e30ff8449ae69f37b7a1412744c734d"
	    "243e129901670aafd6c10384ba334af7ea7a2d8d7686ab94c50595318bec0a02"
	    "7cdc92303677967e8213e45934f2c5a45fa3a6b684dd01b8ecc5b03ba10e07b4")

prepare() {
  cp psx-template.desktop "${_app_id}.desktop"
  sed -i "s/%_title%/${_title}/g" "${_app_id}.desktop"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${_app_id}.desktop"
  sed -i "s/%pkgdesc%/${pkgdesc}/g" "${_app_id}.desktop"
  sed -i "s/%_app_id%/${_app_id}/g" "${_app_id}.desktop"

  cp launcher "${pkgbase}"
  sed -i "s/%_app_id%/${_app_id}/g" "${pkgbase}"
  sed -i "s/%pkgbase%/${pkgbase}/g" "${pkgbase}"

  mv "${_rom_filename_jp}.bin" "${_uuid_jp}.bin"
  cp "${_uuid_en}.cue" "${_uuid_jp}.cue"

  echo "/usr/games/${_app_id}/${_uuid}.cue" > any
  sed -i -e "s/${_rom_filename_en}/${_uuid_en}.bin/g" "${_uuid_en}.cue"
  sed -i -e "s/${_rom_filename_en}/${_uuid_jp}.bin/g" "${_uuid_jp}.cue"
  sed -i -e "s/${_rom_filename_it}/${_uuid_it}.bin/g" "${_uuid_it}.cue"
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

package_crash-bandicoot() {
  install -Dm644 any "${pkgdir}/usr/games/${_app_id}/any"
  install -Dm644 "${_app_id}.png" "${pkgdir}/usr/share/icons/${_app_id}.png"
  install -Dm755 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_app_id}.desktop"
  install -Dm755 "${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"
}

package_crash-bandicoot-en() {
  depends+=($pkgbase)
  local _lang="en"
  local _uuid="${_uuid_en}"
  _package "${_uuid}" "${_lang}"
}

package_crash-bandicoot-it() {
  depends+=($pkgbase)
  local _lang="it"
  local _uuid="${_uuid_it}"
  _package "${_uuid}" "${_lang}"
}

package_crash-bandicoot-de() {
  depends=("${pkgbase}-it")
  local _lang="de"
  local _uuid="${_uuid_de}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_crash-bandicoot-es() {
  depends=("${pkgbase}-it")
  local _lang="es"
  local _uuid="${_uuid_es}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_crash-bandicoot-fr() {
  depends=("${pkgbase}-it")
  local _lang="fr"
  local _uuid="${_uuid_fr}"
  mkdir -p "${pkgdir}/usr/games/${_app_id}"
  echo "/usr/games/${_app_id}/${_uuid}.cue" > "${pkgdir}/usr/games/${_app_id}/${_lang}"
}

package_crash-bandicoot-jp() {
  depends+=($pkgbase)
  local _lang="jp"
  local _uuid="${_uuid_jp}"
  _package "${_uuid}" "${_lang}"
}
