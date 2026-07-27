pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgrel=1
epoch=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64' 'aarch64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=('!strip' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu' 'clash-nyanpasu-bin' 'mihomo')
provides=('clash-nyanpasu')
makedepends=('curl')

_release_assets_url="https://github.com/LibNyanpasu/clash-nyanpasu/releases/expanded_assets/pre-release"
_release_assets_html="$(curl -fsSL "${_release_assets_url}" | tr '\n' ' ' | sed 's#</li>#</li>\n#g')"

_get_asset_block() {
  local deb_arch="$1"

  printf '%s\n' "${_release_assets_html}" |
    grep -m1 -E "href=\"[^\"]*/Clash\\.Nyanpasu_[^\"]+_${deb_arch}\\.deb\""
}

_asset_block_amd64="$(_get_asset_block amd64)"
_asset_block_arm64="$(_get_asset_block arm64)"

_get_asset_version() {
  local asset_block="$1"
  local deb_arch="$2"

  printf '%s\n' "${asset_block}" |
    grep -oP "href=\"[^\"]*/Clash\\.Nyanpasu_\\K[^\"]+(?=_${deb_arch}\\.deb\")" |
    head -n1
}

_get_asset_sha256() {
  local asset_block="$1"

  printf '%s\n' "${asset_block}" |
    grep -oP 'sha256:\K[0-9a-fA-F]{64}' |
    head -n1 |
    tr '[:upper:]' '[:lower:]'
}

_pkgver="$(_get_asset_version "${_asset_block_amd64}" amd64)"
_pkgver_arm64="$(_get_asset_version "${_asset_block_arm64}" arm64)"
_asset_sha256_amd64="$(_get_asset_sha256 "${_asset_block_amd64}")"
_asset_sha256_arm64="$(_get_asset_sha256 "${_asset_block_arm64}")"

_release_date="$(
  printf '%s\n' "${_asset_block_amd64}" |
    grep -oP '<relative-time[^>]*datetime="\K[0-9]{4}-[0-9]{2}-[0-9]{2}(?=T)' |
    head -n1
)"
_release_date="${_release_date//-/}"

if [[ -z "${_pkgver}" || -z "${_pkgver_arm64}" ||
      -z "${_asset_sha256_amd64}" || -z "${_asset_sha256_arm64}" ||
      -z "${_release_date}" ]]; then
  printf 'ERROR: failed to extract version, checksums or release date from GitHub assets page\n' >&2
  exit 1
fi

if [[ "${_pkgver}" != "${_pkgver_arm64}" ]]; then
  printf 'ERROR: amd64 and arm64 asset versions do not match: %s != %s\n' \
    "${_pkgver}" "${_pkgver_arm64}" >&2
  exit 1
fi

_base_version="${_pkgver%%+*}"
_git_sha="${_pkgver##*.}"

if [[ "${_base_version}" == "${_pkgver}" || ! "${_git_sha}" =~ ^[0-9a-fA-F]{7,40}$ ]]; then
  printf 'ERROR: unexpected upstream version format: %s\n' "${_pkgver}" >&2
  exit 1
fi

pkgver="${_base_version}.${_release_date:2}.${_git_sha}"

source=("logo.svg::https://github.com/LibNyanpasu/clash-nyanpasu/raw/refs/heads/main/frontend/nyanpasu/src/assets/image/logo.svg")
sha256sums=('07bdec01fa4fab2015ef605371e0760f0ba45d60fbee4795a5f56cd5638f3d23')

source_x86_64=("${_pkgname}-${_pkgver}-x86_64.deb::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/pre-release/Clash.Nyanpasu_${_pkgver}_amd64.deb")
sha256sums_x86_64=("${_asset_sha256_amd64}")

source_aarch64=("${_pkgname}-${_pkgver}-aarch64.deb::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/pre-release/Clash.Nyanpasu_${_pkgver}_arm64.deb")
sha256sums_aarch64=("${_asset_sha256_arm64}")

package() {
  tar xpf data.tar.gz -C "${pkgdir}"

  # Fix icons
  install -Dm644 logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  mv "${pkgdir}/usr/share/icons/hicolor/32x32/apps/Clash Nyanpasu.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  mv "${pkgdir}/usr/share/icons/hicolor/128x128/apps/Clash Nyanpasu.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/Clash Nyanpasu.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/${_pkgname}.png"
  sed -i "s/Icon=Clash Nyanpasu/Icon=${_pkgname}/" "${pkgdir}/usr/share/applications/Clash Nyanpasu.desktop"

  # Fix program name for autostart
  mv "${pkgdir}/usr/bin/Clash Nyanpasu" "${pkgdir}/usr/bin/${_pkgname}"
  mv "${pkgdir}/usr/lib/Clash Nyanpasu" "${pkgdir}/usr/lib/${_pkgname}"
  sed -i "s/Exec=\"Clash Nyanpasu\"/Exec=${_pkgname}/" "${pkgdir}/usr/share/applications/Clash Nyanpasu.desktop"
}
