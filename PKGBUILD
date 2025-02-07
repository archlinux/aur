# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Dezor"
pkgname="${_Name,,}"
pkgver=1.5.8
pkgrel=1
pkgdesc="The web browser including VPN & Adblocker"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://www.dezor.net"
license=('custom:Proprietary')
depends=('glibc' 'zlib' 'hicolor-icon-theme')
provides=("${pkgname}-appimage")
conflicts=("${pkgname}-appimage")
replaces=("${pkgname}-appimage")
options=('!strip' '!debug')
_pkgsrc="${pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.AppImage::https://cdn.dezor.net/updates/net.dezor.browser/linux/${_Name}-v${pkgver}-arm64.AppImage")
source_armv7h=("${_pkgsrc}-armv7h.AppImage::https://cdn.dezor.net/updates/net.dezor.browser/linux/${_Name}-v${pkgver}-armv7l.AppImage")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://cdn.dezor.net/updates/net.dezor.browser/linux/${_Name}-v${pkgver}-x86_64.AppImage")
b2sums_aarch64=('d25c720405cd42b5a207e0e0f0bbe960cd68c1a698be2f4b50137dad37458eb1afbd406ec33078660f24d98be538ebbead60e96aca3fd6eaf0c209f285e9f8de')
b2sums_armv7h=('d20f2b8f0b7ecb22c38cb045333bfb51978ff82ec95269742d0da749e074fbfc252ed5574a57787bec301f465421cd225f09b295f48c08b3d9d439c989b5534d')
b2sums_x86_64=('280766d69787c60147bc3b2432081c67807251fa90d7244e4697930235b06a1db788ce5b8ab0f37a04edb11cda7debededa0a6bd85b2b809475b436aaa085309')

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null

  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/

  cd "${_pkgsrc}-${CARCH}"
  sed -i "s/AppRun --no-sandbox/${pkgname}/g" "${pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  find "usr/share" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/{}" \;

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
