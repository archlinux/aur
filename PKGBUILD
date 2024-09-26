# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="discordmessenger"
pkgname="${_pkgname}-msvc"
pkgver=1.06
pkgrel=1
pkgdesc="A free Discord-compatible messaging client (MSVC)"
arch=('x86_64' 'i686')
url="https://github.com/DiscordMessenger/dm"
license=('MIT')
depends=('sh' 'wine')
makedepends=('gendesk' 'imagemagick' 'p7zip')
provides=("${_pkgname}")
options=('!debug' '!strip')
_pkgsrc="${pkgname}-${pkgver}"
noextract=("${_pkgsrc}.zip")
source=("${_pkgsrc}.zip::${url}/releases/download/v${pkgver}/DiscordMessenger-V${pkgver}-MSVC.zip"
        "README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE"
        "${pkgname}.sh")
b2sums=('4f21aa316653b8cbb97107e4b67c76e368de64cb1bb49835bf7a6164e90a3502458be0cf9a5d6845db35b80fe8c784862892a3ea0f4a079c52a603d65a68f133'
        '7c79dcbc6650a2bfc7bb69a3d4ed64894e6bb1be1e7e041ce02d9eb515a5d6481149dbc1ea2eb420496ecadf02f90a75ff6698a3d6b86ff4229de61f38a6f754'
        'd31edddf6683a3b1f505057c458022dde42f7d3515a209b91ed09696a363dc6a499482e585598cee18da3d61c2f99be49d7aa5ae1869649bd8f1501a896ba8ea'
        'dde8827c89493ff36d28dc641bd5d8a84edc5274d2b7678cac800b60321c71f4d8d882b154d0e51560f19679fe2f63b9466ebbbc48c30d06b135bce75571e514')

# declare -rg sizes=(16 24 32 48 64)

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}"
  bsdtar -xf "${_pkgsrc}.zip" -C "${srcdir}/${_pkgsrc}"
}

build() {
  cd "${srcdir}"
  gendesk -f \
    --pkgname "${pkgname}" \
    --name "Discord Messenger (MSVC)" \
    --pkgdesc "${pkgdesc}" \
    --categories "AudioVideo;Chat" \
    --icon "/usr/share/pixmaps/${pkgname}.png"

  7z x "${_pkgsrc}/DiscordMessenger.exe" -o./"exe-${pkgver}" -aoa
  cd "exe-${pkgver}/.rsrc/ICON"
  # for ((i=0; i<${#sizes[@]}; i++)); do
  #   magick "$((i+1)).ico" -thumbnail "${sizes[$i]}x${sizes[$i]}" -alpha on -background none -flatten "${sizes[$i]}x${sizes[$i]}.png"
  # done
  magick "10.ico" -thumbnail "64x64" -alpha on -background none -flatten "64x64.png"
}

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}.sh"       "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}.desktop"  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "${_pkgsrc}"/* "${pkgdir}/usr/share/${pkgname}"

  cd "exe-${pkgver}/.rsrc/ICON"
  # for size in "${sizes[@]}"; do
  #   install -Dm644 "${size}x${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
  # done
  install -Dm644 "64x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  find "${pkgdir}/usr/share" -type f -exec chmod 644 "{}" \;
  find "${pkgdir}/usr/share" -type d -exec chmod 755 "{}" \;
}
