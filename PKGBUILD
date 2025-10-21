# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="CrealityPrint"
_pkgname="creality-print"
pkgname="${_pkgname}-bin"
pkgver=6.3.0.3420
_pkgver="${pkgver%.*}"
pkgrel=2
epoch=1
pkgdesc="3D slicer for Creality printers"
arch=('x86_64')
url="https://www.creality.com"
_url="https://github.com/CrealityOfficial/${_Name}"
license=('AGPL-3.0-only')
depends=(
  'at-spi2-core'
  'bzip2'
  'cairo'
  'dbus'
  'expat'
  'fontconfig'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'harfbuzz'
  'libdeflate'
  'libgl'
  'libice'
  'libsecret'
  'libsm'
  'libsoup3'
  'libx11'
  'libxext'
  'nspr'
  'nss'
  'pango'
  'sh'
  'wayland'
  'webkit2gtk-4.1'
  'zlib'
  'zstd'
)
makedepends=(
  'patchelf'
)
optdepends=(
  'python'
  'slicer-udev: 3D printer connection rules'
)
provides=(
  "${_pkgname}=${_pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}.sh"
        "${_pkgname}-${_pkgver}-README.md::${_url}/raw/refs/tags/v${_pkgver}/README.md"
        "${_pkgname}-${_pkgver}-LICENSE.txt::${_url}/raw/refs/tags/v${_pkgver}/LICENSE.txt")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::${_url}/releases/download/v${_pkgver}/${_Name}_Ubuntu2404-V${pkgver}-x86_64-Release.AppImage")
sha256sums=('11c4dc922dfc686a051c2169549d8934ae1a0477fdf5c225860db08eb51a8fc1'
            'a087787e8a3239bfbc0dc051565236dad4ff34ead1a3396c9cd17984fe898884'
            '5537d2d539c94627446bf7eb30d30fda28d1de8aa9a41c25b83012db52ff6f8b')
sha256sums_x86_64=('93ef28e94890935498e535918b59ff5a5a1b647ac8f43ea5310c99a2dad7a3f2')

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}"
  sed -i "s/AppRun/${_Name}/g" "${_Name}.desktop"

  patchelf --remove-rpath "bin/${_Name}"
  patchelf --clear-execstack "bin/${_Name}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgname}-${_pkgver}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgname}-${_pkgver}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"

  cd "${_pkgsrc}-${CARCH}"
  install -vDm644 "${_Name}.desktop" "${pkgdir}/usr/share/applications/${_Name}.desktop"
  install -vDm644 "${_Name}.png" "${pkgdir}/usr/share/pixmaps/${_Name}.png"

  install -vdm755 "${pkgdir}/opt/${_pkgname}"
  cp -a --no-preserve=ownership -t "${pkgdir}/opt/${_pkgname}" "bin" "resources" "usr/lib"
}
