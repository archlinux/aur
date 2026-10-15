#!/usr/bin/env bash
# shellcheck disable=SC2034,SC2086,SC2128,SC2148,SC2154,SC2164,SC2291

# Maintainer: Toria <ninetailedtori@uwu.gal>

_pkgname='puppyclicker'
pkgname="${_pkgname}-appimage"
pkgver=3.5.8
pkgrel=4
pkgdesc='Click your puppies from anywhere. (By Boundfire.)'
url="https://${_pkgname}.app/"
arch=(
  'x86_64'
  'aarch64'
)
license=('unknown')
_cdn_url="https://cdn${_pkgname}.boundfire.com/build"
makedepends=(
  'grep'
  'asar'
  'appimagetool-bin'
)
options=(!strip)
source_x86_64=(
  "${_pkgname}.AppImage::${_cdn_url}/linux.AppImage"
  "puppyclicker-license.md"
)
source_aarch64=(
  "${_pkgname}.AppImage::${_cdn_url}/linux-arm64.AppImage"
  "puppyclicker-license.md"
)

sha256sums_x86_64=('f5598b9c7cbd16ad79c199802f9b046d9ec225b1d7c61ada219c865b626a4574'
                   '2a0ebc3fb014b148fe287a70d2c6e9935cf78c2ac619c6f8a45958559ecb268c')
sha256sums_aarch64=('f5598b9c7cbd16ad79c199802f9b046d9ec225b1d7c61ada219c865b626a4574'
                    '2a0ebc3fb014b148fe287a70d2c6e9935cf78c2ac619c6f8a45958559ecb268c')
sha384sums_x86_64=('ab8784603786b33a079c30fe3fd31e1731ec9c96588f545c1c6b898216e928b23d58c935b2e2de78e24010fc5368c0de'
                   '05587461fd2fc94bce53f761d87c2f91ad67adaa03c8cdd5cc407164c5b9261192f5add862d17bf69636f15c520a647a')
sha384sums_aarch64=('ab8784603786b33a079c30fe3fd31e1731ec9c96588f545c1c6b898216e928b23d58c935b2e2de78e24010fc5368c0de'
                    '05587461fd2fc94bce53f761d87c2f91ad67adaa03c8cdd5cc407164c5b9261192f5add862d17bf69636f15c520a647a')
sha512sums_x86_64=('1eb9e7dd960e3ff0031a8d38be40b7eaea95c1635454b3065d2ad0920eff3d10a31e3bd431ce623ad0cf4c611c06ba0bb4d897eaa49bdc23f55b1ead81fe69dd'
                   'cbd5205e22a188b439ea2593c5ac97b0d55be3541972eab9224c30feca5c571276201e20b8286db45bcad46215dbf845a1abb1268c480259c11c0457a52d9731')
sha512sums_aarch64=('1eb9e7dd960e3ff0031a8d38be40b7eaea95c1635454b3065d2ad0920eff3d10a31e3bd431ce623ad0cf4c611c06ba0bb4d897eaa49bdc23f55b1ead81fe69dd'
                    'cbd5205e22a188b439ea2593c5ac97b0d55be3541972eab9224c30feca5c571276201e20b8286db45bcad46215dbf845a1abb1268c480259c11c0457a52d9731')
b2sums_x86_64=('3f13ef8551658b456c5938aff4853947a560b680863d52dd7787faa7169f72f162b2a8f1009ddf26588715d84e0f4a86c4e5f7fbc12bde58ac43bf2338698a33'
               'e6a92d19a4a1b366e8db94b782b4c130a74ae0bf8f17af733278a9f88517579580d1148d300dfc445fe7ab63dbee8137df7ccd55b45b6fcb63b3eb408c6d6679')
b2sums_aarch64=('3f13ef8551658b456c5938aff4853947a560b680863d52dd7787faa7169f72f162b2a8f1009ddf26588715d84e0f4a86c4e5f7fbc12bde58ac43bf2338698a33'
                'e6a92d19a4a1b366e8db94b782b4c130a74ae0bf8f17af733278a9f88517579580d1148d300dfc445fe7ab63dbee8137df7ccd55b45b6fcb63b3eb408c6d6679')

prepare() {
  cd "${srcdir}"

  chmod                    755                "${_pkgname}.AppImage"
  "./${_pkgname}.AppImage" --appimage-extract &>/dev/null

  cp  -t "./" "squashfs-root/${_pkgname}.desktop"
  sed -i 's|^Exec=AppRun.*|Exec=/usr/bin/puppyclicker %U|' "${_pkgname}.desktop"

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

  install -Dm644 "puppyclicker-license.md" "${pkgdir}/usr/share/${pkgname}/LICENSE.md"
}
