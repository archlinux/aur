# Maintainer: Bakasura <bakasura@protonmail.ch>

pkgname=protonmail-nativefier
pkgver=1.0
pkgrel=1
pkgdesc="ProtonMail desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://mail.protonmail.com"
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
sha256sums=(
  "b0625a8b8bd1426a1c2fa62ddec2a9078a95f30375d98788158cd5da9bd389b2"
  "5d811db1f4256cc0b7d28c5df325d44717e73d4df986f99f3ff8fc9ce83a7567"
  "6b08438dcb9d2e3e67cacf9d7e00796b6bc2b49d4461fbfc74292cc162d0cf63"
  "2f58b27a7eaa498992d92399ce9b02fb24abc56bafa62de1db9a78dcca165598"
  "c2ef2a128049a5c28ff401d8c4ad791651273704f34df931ad89c808a8a8eaf6"
  "453377e1928f0d3361b255a36f3c3c8d39b6faf87a21b54c8d925a29e0ba7c22"
  "b2dfea1ff268ccec86367cf644c301512893f8bf4abfb7b6f08cde4f69b93dd1"
)

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
    --tray \
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
