# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>

pkgname=geforcenow-nativefier
pkgver=20201122
pkgrel=1
pkgdesc="GeForce NOW desktop app built with nativefier (electron)"
arch=("i686" "x86_64")
url="https://play.geforcenow.com/mall/"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
)
md5sums=('52b3c84a5b609b61acab623cc52007b4'
         'f3715ff82faf28c158fc7f3bf8348217')

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "GeForce NOW" \
    --icon "${pkgname}.png" \
    --maximize \
    --browserwindow-options '{ "webPreferences": { "nativeWindowOpen": true } }' \
    --internal-urls ".*?" \
    --verbose \
    --honest \
    --single-instance \
    --ignore-gpu-blacklist \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls -l "${srcdir}" | grep "[Gg]e[Ff]orce[Nn][Oo][Ww]-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "[Gg]e[Ff]orce[Nn][Oo][Ww]" | awk '{print $9}')

  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}

