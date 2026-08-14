# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kikitan-translator"
pkgname="${_pkgname}-bin"
pkgver=2.0.0alpha3
_pkgver="${pkgver//alpha/-alpha}"
pkgrel=1
pkgdesc="VRChat Live Translation Application"
arch=(
  'x86_64'
)
url="https://github.com/YusufOzmen01/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'aspnet-runtime-9.0'
  'glib2'
  'gtk3'
  'libnotify'
  'webkit2gtk-4.1'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${_pkgver}"
source=(
  "${_pkgsrc}-LICENSE.md::${url}/raw/refs/tags/v${_pkgver}/LICENSE.md"
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${_pkgver}/README.md"
)
source_x86_64=(
  "com.github.yusufozmen01.kikitan-translator-${_pkgver}.AppImage::${url}/releases/download/v${_pkgver}/com.github.yusufozmen01.kikitan-translator.AppImage"
)
sha256sums=('edfc2dce27e3ce366ae07f95298da8378b241708444ed9e18996a3f195426dd6'
            '7a24d010fffd2773c8bef649f512b6aead909bdee4154673f6c97d7db92057c8')
sha256sums_x86_64=('75cc7778464a76e71747bdd3d69ac3e6fd1aa422e701909dec4cbc37b9bb97e7')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url%%::*}"

  cd "${srcdir}"
  chmod +x "${source_artifact}"
  ./"${source_artifact}" --appimage-extract > /dev/null
  rm -rf "${source_artifact%.AppImage}"
  mv -f "squashfs-root" "${source_artifact%.AppImage}"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url%%::*}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${source_artifact%.AppImage}"
  install -vDm644 "com.github.yusufozmen01.kikitan-translator.desktop" -t "${pkgdir}/usr/share/applications"
  install -vDm644 "com.github.yusufozmen01.kikitan-translator.ico"     -t "${pkgdir}/usr/share/pixmaps"

  install -vd "${pkgdir}/usr/lib/${_pkgname}"
  cp -vaT --no-preserve=ownership "usr/bin" "${pkgdir}/usr/lib/${_pkgname}"

  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/lib/${_pkgname}/KikitanTranslator.Photino" "${pkgdir}/usr/bin/KikitanTranslator.Photino"
}
