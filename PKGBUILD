# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="CrealityPrint"
_pkgname="creality-print"
pkgname="${_pkgname}-bin"
pkgver=7.2.0.5251
_pkgver="${pkgver%.*}"
pkgrel=1
epoch=1
pkgdesc="3D slicer for Creality printers"
arch=(
  'x86_64'
)
url="https://www.creality.com"
_url="https://github.com/CrealityOfficial/${_Name}"
license=(
  'AGPL-3.0-only'
)
depends=(
  'at-spi2-core'
  'bzip2'
  'cairo'
  'dbus'
  'expat'
  'fontconfig'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'harfbuzz'
  'libatomic'
  'libdeflate'
  'libgcc'
  'libgl'
  'libice'
  'libsecret'
  'libsm'
  'libsoup3'
  'libstdc++'
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
  # 'python'
  'slicer-udev: 3D printer connection rules'
)
provides=(
  "${_pkgname}=${_pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${_pkgver}"
source=(
  "${_pkgname}.sh"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${_pkgver}/README.md"
  "${_pkgsrc}-LICENSE.txt::${_url}/raw/refs/tags/v${_pkgver}/LICENSE.txt"
)
source_x86_64=(
  "${_url}/releases/download/v${_pkgver}/${_Name}-ubuntu2404-V${pkgver}-x86_64-Release.AppImage"
)
sha256sums=('11c4dc922dfc686a051c2169549d8934ae1a0477fdf5c225860db08eb51a8fc1'
            'a087787e8a3239bfbc0dc051565236dad4ff34ead1a3396c9cd17984fe898884'
            '5537d2d539c94627446bf7eb30d30fda28d1de8aa9a41c25b83012db52ff6f8b')
sha256sums_x86_64=('572f8cfdc6c6818aaaf059acc01c36a023b08e8ec4f86674b3febebf17e84954')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  chmod +x "${source_artifact}"
  ./"${source_artifact}" --appimage-extract > /dev/null
  rm -rf "${source_artifact%.AppImage}"
  mv -f "squashfs-root" "${source_artifact%.AppImage}"

  cd "${source_artifact%.AppImage}"
  sed -i "s/AppRun/${_Name}/g" "${_Name}.desktop"

  patchelf --remove-rpath "bin/${_Name}"
  patchelf --clear-execstack "bin/${_Name}"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"

  cd "${source_artifact%.AppImage}"
  install -vDm644 "${_Name}.desktop" "${pkgdir}/usr/share/applications/${_Name}.desktop"
  install -vDm644 "${_Name}.png" "${pkgdir}/usr/share/pixmaps/${_Name}.png"

  install -vdm755 "${pkgdir}/opt/${_pkgname}"
  cp -a --no-preserve=ownership -t "${pkgdir}/opt/${_pkgname}" "bin" "resources" "usr/lib"
}
