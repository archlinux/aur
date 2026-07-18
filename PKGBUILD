# Maintainer: amgsk <y.amgsk@gmail.com>
pkgname=meguri-bin
_appname=Meguri
pkgver=0.2.2
pkgrel=1
pkgdesc="Local video and image browser with thumbnails, search, and playback"
arch=('x86_64')
url="https://github.com/zabuton-app/meguri"
license=('MIT')
depends=('fuse2')
options=('!strip')
provides=('meguri')
conflicts=('meguri')
_appimage="${_appname}-${pkgver}-linux-x86_64.AppImage"
source=("${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/zabuton-app/meguri/v${pkgver}/LICENSE")
noextract=("${_appimage}")
sha256sums=('31cc9796de0f66f2f1b0ddaae6625cb7b83e7569994fc864b942b8da461a4137'
            '34899600608d60479abff088841cd9d60a8552ff3017965da268efc5cffc5178')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract meguri.desktop > /dev/null
  ./"${_appimage}" --appimage-extract 'usr/share/icons' > /dev/null
  sed -i 's|^Exec=AppRun|Exec=meguri|' squashfs-root/meguri.desktop
}

package() {
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${_appname}.AppImage"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_appname}.AppImage" "${pkgdir}/usr/bin/meguri"
  install -Dm644 squashfs-root/meguri.desktop \
    "${pkgdir}/usr/share/applications/meguri.desktop"
  local icon
  for icon in squashfs-root/usr/share/icons/hicolor/*/apps/meguri.png; do
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/${icon#squashfs-root/usr/share/icons/}"
  done
  install -Dm644 "LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
