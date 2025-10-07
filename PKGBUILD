# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="RMG"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=0.8.3
pkgrel=1
pkgdesc="Rosalie's Mupen GUI"
arch=('x86_64')
url="https://github.com/Rosalie241/${_Name}"
license=('GPL-3.0-only')
depends=('freetype2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'hidapi' 'libgl'
         'libpng' 'libsamplerate' 'minizip' 'qt6-base' 'qt6-svg'
         'qt6-websockets' 'sdl2' 'sdl2_net' 'speexdsp' 'systemd-libs' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_Name}-Portable-Linux64-v${pkgver}.AppImage")
sha256sums=('c0d7f97f92b2a943182410c63654f4703e1b31a7823077e72da37a0466e5e8e9'
            'e57f1c320b8cf8798a7d2ff83a6f9e06a33a03585f6e065fea97f1d86db84052')
sha256sums_x86_64=('73678487d85cd54b0843a68d00df33ca28a8a184cebf0f695ff2a5adbcdfb2e3')

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  find "share/applications" "share/icons" "share/metainfo" "share/${_Name}" -type f -exec \
    install -Dm644 "{}" "${pkgdir}/usr/{}" \;

  cd "shared"
  find "bin" -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  
  find "lib/${_Name}" -type f -exec \
    install -Dm644 "{}" "${pkgdir}/usr/{}" \;
  find "lib" -mindepth 1 -maxdepth 1 -type f -name "*${_Name}*" -exec \
    install -Dm644 "{}" "${pkgdir}/usr/{}" \;
}
