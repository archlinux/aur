# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: digital_mystik <dgtl underscore mystik at protonmail dot ch>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-appimage"
pkgver=0.46.0
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
b2sums=('d75607eabee897f7049fb7a699dc0e202b77236f315a3dd5e3e9f1ea1a3f1bd081442009dc25d10a1d0b7d247b4bd57d0703a7b8fd5261129c747a3684a0563c'
        '33ef7da38179ac650b792f52679e2961e0e9dc14ccb6a2a0db4cc21485c789fbe1b65c5b256f74be430ba2d41139d9330e16f615a4344f10de139e2a4c429e55'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('b7ac9d6c28a2c409dce39218866e61bafe5298feb9cff5a85c95fa273133b18786725a5ff06f6cb6e0dc64cdbba6d4d1264e1be8bec998b3347d953562998592')

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
  sed -e 's/^Exec=/Exec=env DESKTOPINTEGRATION=false /g' \
      -e "s/AppRun/${_pkgname}/g" \
      -i "${_pkgname}.desktop"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
  install -vDm644 "${_pkgsrc}-CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  find "usr/share" -type f -exec install -vDm644 "{}" "${pkgdir}/{}" \;

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
