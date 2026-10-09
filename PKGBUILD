# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="CrealityPrint"
_pkgname="creality-print"
pkgname="${_pkgname}-bin"
pkgver=7.3.0.6151
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
  # 'alsa-lib'
  'at-spi2-core'
  'bzip2'
  'cairo'
  'dbus'
  # 'expat'
  'fontconfig'
  'freetype2'
  'fribidi'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  # 'glu'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'harfbuzz'
  # 'lerc'
  'libatomic'
  'libdeflate'
  'libgcc'
  'libglvnd'
  'libice'
  # 'libmspack'
  # 'libsecret'
  'libsm'
  'libsoup3'
  # 'libsrtp'
  'libstdc++'
  'libthai'
  'libtiff'
  'libx11'
  'libxext'
  'libxft'
  'libxkbcommon'
  'libxrender'
  'nspr'
  'nss'
  # 'opus'
  # 'pango'
  'sh'
  # 'speexdsp'
  'wayland'
  'webkit2gtk-4.1'
  # 'xz'
  # 'zlib'
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
  "${_url}/releases/download/v${_pkgver}/${_Name}-V${pkgver}-x86_64-Release.AppImage"
)
sha256sums=('11c4dc922dfc686a051c2169549d8934ae1a0477fdf5c225860db08eb51a8fc1'
            '83686d847e3403f7025427c411ce97257cbe522b6e95a5f5a44456c79af11d8c'
            '5537d2d539c94627446bf7eb30d30fda28d1de8aa9a41c25b83012db52ff6f8b')
sha256sums_x86_64=('96d3b74d24745fa0d664b23e031595db4e5b79830e4d8b885e728c172ef9915c')

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
  install -vDm644 "${_Name}.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm644 "${_Name}.png"     -t "${pkgdir}/usr/share/pixmaps"

  install -vdm755 "${pkgdir}/opt/${_pkgname}"
  cp -a --no-preserve=ownership -t "${pkgdir}/opt/${_pkgname}" "bin" "resources" "usr/lib"
}
