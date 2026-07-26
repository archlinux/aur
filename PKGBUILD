# Maintainer: MCbabel <https://github.com/MCbabel>
pkgname=steam-manifest-downloader-bin
_pkgname=steam-manifest-downloader
pkgver=1.4.3
pkgrel=1
pkgdesc="Download Steam game depots and manifests via a modern Tauri GUI (precompiled)"
arch=('x86_64')
url="https://github.com/MCbabel/Steam-Manifest-Downloader"
license=('GPL-2.0-or-later')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'openssl'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=(!strip)
source=(
  "${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Steam.Manifest.Downloader_${pkgver}_amd64.AppImage"
  "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  '792b1cc3ed67e0b4a240f88242e1a23e88c0b949dd5a637e033d3f3b8bfaf7cd'
  'f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505'
)
noextract=("${_pkgname}-${pkgver}.AppImage")

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgname}-${pkgver}.AppImage"
  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
}

package() {
  cd "${srcdir}/squashfs-root"

  install -Dm755 "usr/bin/steam-manifest-downloader" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "usr/share/icons/hicolor/256x256/apps/steam-manifest-downloader.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Categories=Utility;Game;
Exec=${_pkgname}
Icon=${_pkgname}
Name=Steam Manifest Downloader
Type=Application
Terminal=false
Comment=Download Steam game depots and manifests
EOF

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
