# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: digital_mystik <dgtl underscore mystik at protonmail dot ch>
# Maintainer: tee < teeaur at duck dot com >

_pkgname="ipfs-desktop"
pkgname="${_pkgname}-appimage"
pkgver=0.50.1
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
b2sums=('855b085a061491f799337c6c01100f6956b6a60e7dd6fdba30087c24c3f35d08207952884896d2913c6ffdbb7ce700dbb3679e7764879c05001ab669567db7c1'
        '9a230bd0ed9107202e40dbc1974e56077c6c3f25ccf6254e309bb76178e25b66e831d02a04a4fac7761222635cbdc797d958e330e39586a9666b84506674819e'
        '2c3fb2af6c8e92bcacb15b3878b1125fd4f8b4d48e37b2b3ce818517b7a7a94f68ef3c155e8d8cb5b2d39727fe916e293b892c48ee59167b4ee564bbedc70d9d')
b2sums_x86_64=('fc122c64cbfc57d8328d139253ed7cdd51113b449f7b90982a4d4e20c96f34e0e601e4e733ec03b35159d81b75160df192307c66b8b8d94c8a45cf204a051d9e')

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
