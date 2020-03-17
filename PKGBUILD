# Maintainer: Modelmat <modelmat@outlook.com.au>

pkgname=my-study-life
pkgver=0.1.2
pkgrel=1
pkgdesc="A free cross platform planner app for students, teachers and lecturers designed to make your study life easier to manage."
arch=("armv7l" "i686" "x86_64")
url="https://app.mystudylife.com"
license=("custom")
depends=("gtk3" "libxss" "nss")
makedepends=("imagemagick" "nodejs-nativefier")
source=("${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=("702fbfadf6d53cc3a83ad6c8d5031381f7ee58e7cef0228833d1addb2d7de589"
            "059ada2d4a5b85e80a0ea531a3e809967b971df82479106a4004914080a1ab44")

build() {
  cd "${srcdir}"

  nativefier \
    --name "My Study Life" \
    --icon "${pkgname}.png" \
    --verbose \
    --single-instance \
    --internal-urls "(mystudylife|google|microsoftonline|facebook)" \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls -l "${srcdir}" | grep "[Mm]y[-]*[Ss]tudy[-]*[Ll]ife-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "[Mm]y[-]*[Ss]tudy[-]*[Ll]ife" | awk '{print $9}')
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "256x256" "192x192" "128x128" "96x96" "72x72"    "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}

