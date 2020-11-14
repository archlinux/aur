_pkgname=whatsapp-nativefier
pkgname=whatsapp-nativefier-arch-electron
pkgver=2.2045.15
pkgrel=2
pkgdesc="WhatsApp desktop built with nativefier (electron)"
arch=("armv7l" "i686" "x86_64")
url="https://web.${_pkgname%-nativefier}.com"
license=("custom")
depends=("gtk3" "libxss" "nss" "electron")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
conflicts=("whatsapp-nativefier")
provides=("whatsapp-nativefier")
source=(
  "${_pkgname}.png"
  "${_pkgname}.desktop"
  "${_pkgname}-inject.js"
  "WhatsApp"
)
sha256sums=('3899581abcfed9b40b7208bbbca8bdbfe3ae9655980dbf55f04dec9cb3309f27'
            'bad0489ae519bc78afab3d226966691feede8bcedf58025af1b171215ae51423'
            'e794ef339f9fc6ff78ed54236bbeec3fc2d6592c4781ffe69b8e7932e02436c9'
            'abb7aefec2aebc12f1b065b52240730d8d464021ffe06eb802e482b127378502')

build() {
  cd "${srcdir}"
  
  nativefier \
    --name "WhatsApp" \
    --icon "${_pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --inject "${_pkgname}-inject.js" \
    --browserwindow-options '{ "webPreferences": { "spellcheck": true } }' \
    --verbose \
    --single-instance \
    --tray \
    --electron-version 9.0.2 \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${_pkgname}}}}

  _folder=$(ls -l "${srcdir}" | grep "[Ww]hats[-]*[Aa]pp-linux-" | awk '{print $9}')
  _binary=$(ls -l "${srcdir}/${_folder}" | grep "[Ww]hats[-]*[Aa]pp" | awk '{print $9}')

  sed -i -e "/loglevel/d" "${srcdir}/${_folder}/resources/app/lib/preload.js"
  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${_pkgname}"
  ln -s "/opt/${_pkgname}/${_binary}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${_pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
  done
  
  #Begin the slimming
  cd "$pkgdir/opt/${_pkgname}"
  ls | grep -wv "^resources\$\|LICENSE" | xargs rm -fr
  install -Dm755 "$srcdir"/WhatsApp "${pkgdir}/opt/${_pkgname}/${_binary}"
}
