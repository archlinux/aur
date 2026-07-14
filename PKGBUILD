# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="azimuth"
pkgname="${_pkgname}-bin"
pkgver=1.0.4
_commit="32f98f1d0b49956e499cf73b6fdde8fd9f1110fc" # 1.0.4
pkgrel=1
pkgdesc="A metroidvania with vector graphics"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://mdsteele.games/azimuth/"
_url="https://github.com/mdsteele/${_pkgname}"
license=(
  'GPL-3.0-or-later'
)
depends=(
  'glibc'
  'hicolor-icon-theme'
  'libglvnd'
  'sdl2'
)
makedepends=(
  'squashfs-tools'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/${_commit}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/${_commit}/LICENSE"
  "${_pkgsrc}-icon_32x32.png::${_url}/raw/${_commit}/data/icons/icon_32x32.png"
  "${_pkgsrc}-icon_48x48.png::${_url}/raw/${_commit}/data/icons/icon_48x48.png"
  "${_pkgsrc}-icon_64x64.png::${_url}/raw/${_commit}/data/icons/icon_64x64.png"
  "${_pkgsrc}-icon_128x128.png::${_url}/raw/${_commit}/data/icons/icon_128x128.png"
)
# https://askubuntu.com/a/1196449
source_aarch64=(
  "https://api.snapcraft.io/api/v1/snaps/download/0rVgBoeGw5Noxnc0XGWZiy0nfd3yKw2g_136.snap"
)
source_armv7h=(
  "https://api.snapcraft.io/api/v1/snaps/download/0rVgBoeGw5Noxnc0XGWZiy0nfd3yKw2g_137.snap"
)
source_x86_64=(
  "https://api.snapcraft.io/api/v1/snaps/download/0rVgBoeGw5Noxnc0XGWZiy0nfd3yKw2g_135.snap"
)
b2sums=('6b32cc3f889eec20d189957e3fd9dfa9be6ee61a6318116b5c9822dbfa0c0ac73a7812d1973e59c784a966960248ba8bd9dbccda92bd89da1a8ed0359102359c'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        'cc5ff44a6be3e704fe8ed7c4449b195915a5ddebccfa034b2d9ed498b860c9a31785f702362419ffc7136e743089a743d92a68a4c96b50fc25f23ef47de54501'
        '9b198f7003d652fc6d32c945f8c7c45b2c760de5017c79eb25db3b8f79d83679e8988c98ff7e87bcc4c8c1325f702c940b0cb037a51c9d3edcb821cf9c870e1e'
        '4e20fcd941f4f07f05b7c15f645b1219860301f108b2c5a3d621a0841c42fe86b8bba8964cbf27d0175c94d4f343b82b54ca63d6a100299c573fa1ba0dc01e5c'
        '06ddb3297921db0779be520d2e033796fbacaf7955535b9ec652517255ae9a43689f0a1d124e561ad65bb341098f7a243de92ffa1bccb9fc5e34e05f50dbd31e')
b2sums_aarch64=('632dd8c54ea8bcd64f3047a124868959972121f2faa5263801488140863e9ba560bd90e1cd4445a6452539228244df2fb24f88217d7011bddfce6b1c3d8ed45a')
b2sums_armv7h=('26e9981e17388bc558422fe91dd2d1a8a187c75edf9809edfdf7a45dd8a425d6163601aff064b23a35bebf02a756094c11b751b55b4258b5f4bb4a773c27c70a')
b2sums_x86_64=('9b37b375d246e776e4eafc2d4959b272a8ae8d531e31e0f2f1fd8e1065369c0a3028366806c0a791c5a07a71c81a0bf0dc8e45772ecc5c7767c315964445667d')

prepare() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${source_artifact%.snap}" "${source_artifact}"

  cd "${source_artifact%.snap}/meta/gui"
  sed -e "s|^Icon=.*|Icon=${_pkgname}|g" \
      -i "${_pkgname}.desktop"
}

package() {
  local source_array="source_${CARCH}[0]"
  local source_url="${!source_array}"
  local source_artifact="${source_url##*/}"

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  for _icon in 32x32 48x48 64x64 128x128; do
    install -vDm644 "${_pkgsrc}-icon_${_icon}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_icon}/apps/${_pkgname}.png"
  done

  cd "${srcdir}/${source_artifact%.snap}"
  install -vDm755 "Azimuth" "${pkgdir}/usr/bin/${_pkgname}"

  cd "meta/gui"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
