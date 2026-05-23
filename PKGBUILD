# Maintainer: Damian Nowak <spam at nowaker dot net>
# Contributor: Fredy García <frealgagu at gmail dot com>

pkgname=whatsapp-nativefier
pkgver=2.3000.1019818867
pkgrel=1
pkgdesc="WhatsApp desktop (nativefier/Electron) with save-as download dialog, single instance, tray, menu bar, spell checker"
arch=("armv7l" "i686" "x86_64")
url="https://web.whatsapp.com/"
license=("custom")
depends=("gtk3" "libxss" "nss")
optdepends=("libindicator-gtk3")
makedepends=("imagemagick" "nodejs-nativefier" "unzip")
source=(
  "${pkgname}.png"
  "${pkgname}.desktop"
  "${pkgname}-inject.js"
)
sha256sums=(
  "3899581abcfed9b40b7208bbbca8bdbfe3ae9655980dbf55f04dec9cb3309f27"
  "bad0489ae519bc78afab3d226966691feede8bcedf58025af1b171215ae51423"
  "SKIP"
)

build() {
  cd "${srcdir}"

  # nativefier 52.0.0 ships electron-packager 17.1.2 / extract-zip 2.0.1,
  # which silently exits mid Electron-zip extraction when invoked with
  # Node 24+ (no error message, no stack, just an incomplete src/ tree
  # that makes package() fail with "ls | grep" returning nothing).
  # Switch to Node 22 via nvm; this fork is personal so the dependency
  # on ~/.nvm is acceptable.
  if [[ -s "${HOME}/.nvm/nvm.sh" ]]; then
    # shellcheck source=/dev/null
    source "${HOME}/.nvm/nvm.sh"
    nvm use 22 || nvm install 22
  fi

  # --electron-version pins Chromium 128, which is the floor for current
  # WhatsApp Web's CSS (the previous Electron 25.7.0 default ships
  # Chromium 114 and renders chat text the same color as the chat
  # background - selecting the ghost text reveals it is there).
  nativefier \
    --name "WhatsApp" \
    --icon "${pkgname}.png" \
    --width "800px" \
    --height "600px" \
    --electron-version "32.3.3" \
    --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.0 Chrome/132.0.6834.164 Safari/605.1.15" \
    --inject "${pkgname}-inject.js" \
    --verbose \
    --single-instance \
    --tray \
    --show-menu-bar \
    --file-download-options '{
      "saveAs": true,
      "showProgressBar": true,
      "showBadge": true
    }' \
    "${url}"
}

package() {
  install -dm755 "${pkgdir}/"{opt,usr/{bin,share/{applications,licenses/${pkgname}}}}

  _folder=$(ls "${srcdir}" | grep "[Ww]hats[-]*[Aa]pp-linux-")
  _binary=$(ls "${srcdir}/${_folder}" | grep "[Ww]hats[-]*[Aa]pp")

  cp -rL "${srcdir}/${_folder}" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/${_binary}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert "${srcdir}/${pkgname}.png" -strip -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  done
}
