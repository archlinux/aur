# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="azimuth"
pkgname="${_pkgname}-snap"
pkgver=1.0.3
_commit="b1a6bf7bdd3f2c19b3f3293d43cca05d6ddf264c"
pkgrel=3
pkgdesc="A metroidvania with vector graphics"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://mdsteele.games/azimuth"
_url="https://github.com/mdsteele/${_pkgname}"
license=('GPL-3.0-or-later')
makedepends=('squashfs-tools')
depends=('glibc' 'hicolor-icon-theme' 'libglvnd' 'sdl2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url}/raw/${_commit}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/${_commit}/LICENSE"
        "icon_32x32-${pkgver}.png::${_url}/raw/${_commit}/data/icons/icon_32x32.png"
        "icon_48x48-${pkgver}.png::${_url}/raw/${_commit}/data/icons/icon_48x48.png"
        "icon_64x64-${pkgver}.png::${_url}/raw/${_commit}/data/icons/icon_64x64.png"
        "icon_128x128-${pkgver}.png::${_url}/raw/${_commit}/data/icons/icon_128x128.png")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/0rVgBoeGw5Noxnc0XGWZiy0nfd3yKw2g_126.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/0rVgBoeGw5Noxnc0XGWZiy0nfd3yKw2g_124.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/0rVgBoeGw5Noxnc0XGWZiy0nfd3yKw2g_127.snap")
b2sums=('4ababca862bd650e6a6354ef29d81c3af05b52dd4e291f430c0912cc2da52cf7bfe51d5cf0333746c3dc87aaecc1f7e62c8270ea9d31950185db24cc99b7d17e'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c'
        'cc5ff44a6be3e704fe8ed7c4449b195915a5ddebccfa034b2d9ed498b860c9a31785f702362419ffc7136e743089a743d92a68a4c96b50fc25f23ef47de54501'
        '9b198f7003d652fc6d32c945f8c7c45b2c760de5017c79eb25db3b8f79d83679e8988c98ff7e87bcc4c8c1325f702c940b0cb037a51c9d3edcb821cf9c870e1e'
        '4e20fcd941f4f07f05b7c15f645b1219860301f108b2c5a3d621a0841c42fe86b8bba8964cbf27d0175c94d4f343b82b54ca63d6a100299c573fa1ba0dc01e5c'
        '06ddb3297921db0779be520d2e033796fbacaf7955535b9ec652517255ae9a43689f0a1d124e561ad65bb341098f7a243de92ffa1bccb9fc5e34e05f50dbd31e')
b2sums_x86_64=('0f3fd54f91a553304a6b5c88d0741da68344f4c07f3416181113e57750f9b4cc6b0a95f244db2268fc75feacdf72fd2459dc85de607a0d5fcabaf6482c16848c')
b2sums_aarch64=('220aaf78c6ecd4b246a16cc056363f4f01f00d93eced95726ce783a3fa216b509e3beb1804ba1629fd8b5c35b712d2ea44513e7e55a8632077ec648794acb65e')
b2sums_armv7h=('c99707893e3223bf2c0b0fe26a0db98850e9622c2a4cd9d9ab52271a9ca9cf9402d184fd54efb953b8e563fe25f3e74dd39c18e0f435d7d812cafe1f6c589b69')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/meta/gui"
  mv -f "syzygy.desktop" "${_pkgname}.desktop"
  sed -i 's|Icon=${SNAP}/meta/gui/azimuth\.png|Icon=azimuth|' "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  for _icon in 32x32 48x48 64x64 128x128; do
    install -Dm644 "icon_${_icon}-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/${_icon}/apps/${_pkgname}.png"
  done
  
  cd "${_pkgsrc}-${CARCH}"
  install -Dm755 "Azimuth" "${pkgdir}/usr/bin/${_pkgname}"

  cd "meta/gui"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
