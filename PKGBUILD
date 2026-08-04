# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: digital_mystik <dgtl underscore mystik at protonmail dot ch>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-appimage"
pkgver=0.50.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=('x86_64')
url="https://docs.ipfs.tech/install/ipfs-desktop"
_url="https://github.com/ipfs/${_pkgname}"
license=('MIT')
depends=('glibc' 'hicolor-icon-theme' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-CHANGELOG.md::${_url}/raw/v${pkgver}/CHANGELOG.md"
        "${_pkgsrc}-README.md::${_url}/raw/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.AppImage::${_url}/releases/download/v${pkgver}/${_pkgsrc}-linux-x86_64.AppImage")
b2sums=('9c1b7e96a3a1d5af603353e52bbfce74529e67ec7902755f65ba9b82d90291eb13556d873563c7481fcbb2210774cd04bd207d1faf70a3a71d19c991c7f2e90a'
        'e9fb5fab3dc257bea512c808bb212e047680bb3a432b910dbdcd591ea6fc2d9634b5cee8c2336191c4d40b216439e84bfc8ab3c7c39aca8d4f98735aa67d0149'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('eae115f121919fb26c9856c15495558dec55080cd2df8b613e162f3a0dd5f5f1bbd183cd8aba8de90f76d955467a4195451f3c0fc1251458f1f7678040384123')

prepare() {
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null

  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
}

build() {
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/

  cd "${_pkgsrc}-${CARCH}"
  sed -e 's/^Exec=/Exec=env DESKTOPINTEGRATION=false /g' \
      -e "s/AppRun/${_pkgname}/g" \
      -i "${_pkgname}.desktop"
}

package() {
  install -vDm755 "${_pkgsrc}-${CARCH}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  find "usr/share" -type f -exec install -vDm644 "{}" "${pkgdir}/{}" \;

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
