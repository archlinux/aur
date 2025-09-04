# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: digital_mystik <dgtl underscore mystik at protonmail dot ch>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-appimage"
pkgver=0.45.0
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
b2sums=('817b45d56848ee36c299f0d6a7ccf7d2539017eed0a0df71d829d50fb2f1a455ae5e7a8547608335a0a348e89b67b6dff5a78e8b0e46b772a47f59644cd66340'
        '9457488dac09a87a3ec13cbbfdd98f9858ad2e47ba51ec3933ca7dc44ed6d79294e0e76e53ca83bea3d3b327e70830fcc8d1cac0b75a0b7d030e94a7dec6b14e'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('16ccbeccdb74aeee61eed19ccd7451295ed50cfd1f12308f371a515306bbed8bb0222fd71a32b0431382ce0e596144abb04a48be2a564f41928f82dd429f9ae7')

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
