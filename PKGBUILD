# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=protonmail-nativefier
pkgver=r6.d012219
pkgrel=1
pkgdesc="ProtonMail desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://mail.proton.me"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "${pkgname}-2.desktop"
  "${pkgname}-3.desktop"
  "${pkgname}-4.desktop"
  "${pkgname}-5.desktop"
  "multiaccount.patch"
)
sha256sums=('b0625a8b8bd1426a1c2fa62ddec2a9078a95f30375d98788158cd5da9bd389b2'
            'a3be6480caa35888816bed8379f29d3109e1e0c799b95072886b41ee15ba0700'
            'ca5bf00df1c187d8aa1f0bdf74bc0aa47de8214702d8d7077a4172901c37b9c7'
            'ce5386d853b789366daff024c2eff6012327418327f233bd0eed189ee153640f'
            'a4eae34de2711fc798570e38dcf010f85de3b03cbd081b81a325a5732ece85dc'
            'a2c9a7cbf7df69cf3d0ffb7db5f8d2ea9d20e9ea75ccb0198c03c129f4b0e577'
            'b2dfea1ff268ccec86367cf644c301512893f8bf4abfb7b6f08cde4f69b93dd1')

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "ProtonMail" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --user-agent "firefox" \
    --show-menu-bar \
    --verbose \
    --single-instance \
    "${url}"

  _folder=$(ls -l "${srcdir}" | grep "[Pp]roton[Mm]ail-linux-" | awk '{print $9}')

  pwd
  cd ${_folder}
  pwd
  ls -ltrah
  patch -Np0 -i "../multiaccount.patch"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls -l "${srcdir}" | grep "[Pp]roton[Mm]ail-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "[Pp]roton[Mm]ail" | awk '{print $9}')

  sed -i -e "/loglevel/d" "${srcdir}/${_folder}/resources/app/lib/preload.js"
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-2.desktop" "${pkgdir}/usr/share/applications/${pkgname}-2.desktop"
  install -Dm644 "${srcdir}/${pkgname}-3.desktop" "${pkgdir}/usr/share/applications/${pkgname}-3.desktop"
  install -Dm644 "${srcdir}/${pkgname}-4.desktop" "${pkgdir}/usr/share/applications/${pkgname}-4.desktop"
  install -Dm644 "${srcdir}/${pkgname}-5.desktop" "${pkgdir}/usr/share/applications/${pkgname}-5.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
