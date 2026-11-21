#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291

# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname='puppyclicker'
pkgname="${_pkgname}-appimage"
pkgver=3.5.15
pkgrel=1
pkgdesc='Click your puppies from anywhere. (By Boundfire.)'
url="https://${_pkgname}.app/"
arch=(
  'x86_64'
  'aarch64'
)
license=('custom')
_cdn_url="https://cdn${_pkgname}.boundfire.com/build"
makedepends=(
  'grep'
  'appimagetool-bin'
  # 'asar'
)
options=(!strip)
source_x86_64=(
  "${_pkgname}-x86_64.AppImage::${_cdn_url}/linux.AppImage"
  "${_pkgname}-license.md"
)
source_aarch64=(
  "${_pkgname}-aarch64.AppImage::${_cdn_url}/linux-arm64.AppImage"
  "${_pkgname}-license.md"
)

sha256sums_x86_64=('13260216aeed10ce8162ab9275ff2c412cab7c5071be396fc61fd3a009cecd66'
                   '2a0ebc3fb014b148fe287a70d2c6e9935cf78c2ac619c6f8a45958559ecb268c')
sha256sums_aarch64=('6ad04bf319e208a1f5538c621e8023126e257ccc579fcedf4643cbe3c8b11096'
                    '2a0ebc3fb014b148fe287a70d2c6e9935cf78c2ac619c6f8a45958559ecb268c')

_appimage=''
_desktop="${_pkgname}.desktop"

prepare() {
  cd "${srcdir}"

  case "${CARCH}" in
    x86_64)
      _appimage="${_pkgname}-x86_64.AppImage"
      ;;
    aarch64)
      _appimage="${_pkgname}-aarch64.AppImage"
      ;;
    *)
      echo         "unsupported arch: ${CARCH}" >&2
      return 1
      ;;
  esac

  chmod            755                "${_appimage}"
  "./${_appimage}" --appimage-extract &>/dev/null

  cp  -t "./"                                             "squashfs-root/${_desktop}"
  sed -i "s|^Exec=AppRun.*|Exec=/usr/bin/${_pkgname} %U|" "${_desktop}"

  # Patch the launcher to ignore hcaptcha and fix the api endpoint to the new structure.
  # cd           'squashfs-root/resources'
  # asar extract 'app.asar'                                        'app-extracted'
  # (
  #   cd app-extracted/app/_expo/static/js/web/
  #   sed -i \
  #     -e 's/const c=!0;/const c=!1;/g' \
  #     index-*.js
  # )

  # Repack
  # asar pack    'app-extracted'                                   'app.asar'
  # rm -rf       'app-extracted'
  # cd           '../..'
  # appimagetool 'squashfs-root'                                   'puppyclicker'

  cp "${_appimage}" "${_pkgname}"
}

pkgver() {
  cd       "${srcdir}"
  grep -oP 'X-AppImage-Version=\K.*' "${_desktop}"
}

package() {
  cd             "${srcdir}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_desktop}" "${pkgdir}/usr/share/applications/${_desktop}"
  (
    cd   'squashfs-root/usr/share/icons/hicolor'
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/{}" \;
  )

  install -Dm644 "${_pkgname}-license.md" "${pkgdir}/usr/share/${pkgname}/LICENSE.md"
}
