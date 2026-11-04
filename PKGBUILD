#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291

# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname='puppyclicker'
pkgname="${_pkgname}-appimage"
pkgver=3.5.11
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
  "${_pkgname}.AppImage::${_cdn_url}/linux.AppImage"
  "${_pkgname}-license.md"
)
source_aarch64=(
  "${_pkgname}.AppImage::${_cdn_url}/linux-arm64.AppImage"
  "${_pkgname}-license.md"
)

sha256sums_x86_64=(
  '9b9024d69895c64ef172e7395a1f8da51e4e5344baac4f1fc81c80c4bff23e81'
  '2a0ebc3fb014b148fe287a70d2c6e9935cf78c2ac619c6f8a45958559ecb268c'
)
sha256sums_aarch64=(
  '9b9024d69895c64ef172e7395a1f8da51e4e5344baac4f1fc81c80c4bff23e81'
  '2a0ebc3fb014b148fe287a70d2c6e9935cf78c2ac619c6f8a45958559ecb268c'
)

prepare() {
  cd "${srcdir}"

  chmod                    755                "${_pkgname}.AppImage"
  "./${_pkgname}.AppImage" --appimage-extract &>/dev/null

  cp  -t "./" "squashfs-root/${_pkgname}.desktop"
  sed -i "s|^Exec=AppRun.*|Exec=/usr/bin/${_pkgname} %U|" "${_pkgname}.desktop"

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
  cp "${_pkgname}.AppImage" "${_pkgname}"
}

pkgver() {
  cd       "${srcdir}"

  grep -oP 'X-AppImage-Version=\K.*' "${_pkgname}.desktop"
}

package() {
  cd             "${srcdir}"

  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  (
    cd   'squashfs-root/usr/share/icons/hicolor' && \
    find . -type f -exec install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/{}" \;
  )

  install -Dm644 "${_pkgname}-license.md" "${pkgdir}/usr/share/${pkgname}/LICENSE.md"
}
