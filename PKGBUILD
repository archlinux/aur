# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="CrealityPrint"
_pkgname="creality-print"
pkgname="${_pkgname}-bin"
pkgver=6.1.2.2458
_pkgver="${pkgver%.*}"
pkgrel=1
epoch=1
pkgdesc="3D slicer for Creality printers"
arch=('x86_64')
url="https://www.creality.com"
_url="https://github.com/CrealityOfficial/${_Name}"
license=('AGPL-3.0-only')
# 'alsa-lib' 'xz' 'opus' 'speexdsp'   'lerc' 'libmspack'
depends=('cairo' 'dbus' 'expat' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2'
         'glibc' 'gst-plugins-base-libs' 'gstreamer' 'gtk3' 'libgl' 'libsrtp'
         'libusrsctp' 'libx11' nspr 'nss' 'pango' 'sh' 'webkit2gtk-4.1' 'x264'
         'zlib')
makedepends=('patchelf')
optdepends=('python'
            'slicer-udev: 3D printer connection rules'
            'wayland')
provides=("${_pkgname}=${_pkgver}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgname}.sh"
        "${_pkgname}-${_pkgver}-README.md::${_url}/raw/refs/tags/v${_pkgver}/README.md"
        "${_pkgname}-${_pkgver}-LICENSE.txt::${_url}/raw/refs/tags/v${_pkgver}/LICENSE.txt")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::${_url}/releases/download/v${_pkgver}/${_Name}_Ubuntu2404-V${pkgver}-x86_64-Release.AppImage")
sha256sums=('11c4dc922dfc686a051c2169549d8934ae1a0477fdf5c225860db08eb51a8fc1'
            '4477dda5e6d2b3e53018b180469716c199d953675dd787b3afe48ed6995557e4'
            '5537d2d539c94627446bf7eb30d30fda28d1de8aa9a41c25b83012db52ff6f8b')
sha256sums_x86_64=('14237239892fe49607cdb5efdde6b1576a7d4dceac78a630e729bc3b857e240b')

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null
  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}"
  sed -i "s/AppRun/${_Name}/g" "${_Name}.desktop"

  patchelf --remove-rpath "bin/${_Name}"

  # cd "usr/lib"
  # for lib in lib*.so*; do
  #   if [ -e "/usr/lib/$lib" ]; then
  #     rm -vf "$lib"
  #   fi
  # done
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
  cp -r --no-preserve=ownership -t "${pkgdir}/opt/${_pkgname}" "bin" "resources" "usr/lib"
}
