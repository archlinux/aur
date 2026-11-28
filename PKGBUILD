pkgname=koda-desktop-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Koda AI desktop client (prebuilt AppImage)'
arch=('x86_64')
url='https://www.kodacode.ru/'
license=('ISC')
depends=('fuse2')
provides=('koda-desktop')
conflicts=('koda-desktop')
options=('!strip')
source_x86_64=("Koda-Desktop-${pkgver}.AppImage::https://nexus.kodacode.online/repository/koda-desktop/tags/v2.0.0/linux/Koda-Desktop-2.0.0.AppImage")
sha256sums_x86_64=('62a2321a24bcca2b64792b2ac54d94f5518d5cfc8735017dceb123113dd177e5')

prepare() {
  chmod +x "Koda-Desktop-${pkgver}.AppImage"
  ./"Koda-Desktop-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "Koda-Desktop-${pkgver}.AppImage" "${pkgdir}/opt/koda-desktop/Koda-Desktop.AppImage"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/koda-desktop/Koda-Desktop.AppImage "${pkgdir}/usr/bin/koda-desktop"

  desktop_file="$(find squashfs-root -type f -name '*.desktop' -print -quit)"
  if [[ -n "${desktop_file}" ]]; then
    install -Dm644 "${desktop_file}" "${pkgdir}/usr/share/applications/koda-desktop.desktop"
    sed -i -E 's|^Exec=.*|Exec=/usr/bin/koda-desktop %U|' "${pkgdir}/usr/share/applications/koda-desktop.desktop"
  fi
  while IFS= read -r icon; do
    relative="${icon#squashfs-root/usr/share/icons/}"
    install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/${relative}"
  done < <(find squashfs-root/usr/share/icons -type f \( -name '*.png' -o -name '*.svg' \) 2>/dev/null || true)
}
