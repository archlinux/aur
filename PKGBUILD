# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

_pkgname=dartotsu
pkgname=${_pkgname}-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Anilist client for anime and manga'
arch=('x86_64')
url='https://github.com/aayush2622/Dartotsu'
license=('LicenseRef-UPL')
depends=(
  'alsa-lib'
  'gnutls'
  'gtk3'
  'libarchive'
  'libpulse'
  'libunwind'
  'libva'
  'libvdpau'
  'libxss'
  'libxv'
  'webkit2gtk-4.1'
)
makedepends=('patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# Prebuilt Flutter bundle. Stripping breaks the bundled plugins.
options=('!strip' '!debug')

_appimage="Dartotsu_Linux_v${pkgver}.AppImage"
source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/aayush2622/Dartotsu/v${pkgver}/LICENSE.md"
)
noextract=("${_appimage}")
sha256sums=(
  '01b6a8d0e6639d19b90b0b3e7e23a71143202455f224e42e3a56b6c07cd2e76a'
  '80cfe7f4e358a7dfa38f1697330303055a641c5ddd2973f63e508e06b5d367a1'
)

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
  # The AppImage ships directories as mode 700.
  chmod -R a+rX squashfs-root
}

package() {
  local app="${pkgdir}/usr/lib/${_pkgname}"
  local f rp

  install -dm755 "${app}"
  cp -a squashfs-root/usr/bin/. "${app}/"

  # Upstream links Flutter plugins with a RUNPATH into its CI checkout.
  # $ORIGIN keeps them next to the bundled libraries.
  for f in "${app}/lib/"*; do
    [[ -f ${f} ]] || continue
    rp=$(readelf -d "${f}" 2>/dev/null | awk -F'[][]' '/RUNPATH/ {print $2; exit}')
    case "${rp}" in
      /__w/*) patchelf --set-rpath '$ORIGIN' "${f}" ;;
    esac
  done

  # Upstream's launcher script leaves an empty LD_LIBRARY_PATH entry when the
  # variable is unset, which makes the loader search the current directory.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" << EOF
#!/bin/sh
LD_LIBRARY_PATH=/usr/lib/${_pkgname}/lib\${LD_LIBRARY_PATH:+:\$LD_LIBRARY_PATH} exec /usr/lib/${_pkgname}/${_pkgname}.bin "\$@"
EOF

  install -Dm644 squashfs-root/${_pkgname}.desktop \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 squashfs-root/${_pkgname}.png \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "LICENSE-${pkgver}.md" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
