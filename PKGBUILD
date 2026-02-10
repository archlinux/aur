# Maintainer: Keiran <keircn@proton.me>
pkgname=seanime-denshi
_pkgname=seanime-denshi
pkgver=3.4.3
pkgrel=3
pkgdesc="A self-hosted server that seamlessly integrates with your local anime collection with anilist integration. (Denshi AppImage variant)"
arch=(x86_64)
url="https://github.com/5rahim/seanime"
license=('MIT')
depends=('fuse2')
conflicts=('seanime' 'seanime-bin')
options=('!strip')
source=("https://github.com/5rahim/seanime/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.AppImage")
sha256sums=('b267166f36ecfde6d3df1fd39d66209ee49b96ac61ea8a07adaf0e94e69ff937')

package() {
  local appimage="${_pkgname}-${pkgver}_Linux_x86_64.AppImage"

  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${srcdir}/${appimage}" \
    "${pkgdir}/opt/${pkgname}/${appimage}"

  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/${appimage}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Seanime Denshi
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Type=Application
Categories=Network;Video;
Terminal=false
EOF

  if [ ! -d "${srcdir}/squashfs-root" ]; then
    (cd "${srcdir}" && "./${appimage}" --appimage-extract >/dev/null 2>&1 || true)
  fi

  local icon_file=""
  if [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
    icon_file="${srcdir}/squashfs-root/.DirIcon"
  elif [ -d "${srcdir}/squashfs-root/usr/share/icons" ]; then
    icon_file="$(find "${srcdir}/squashfs-root/usr/share/icons" -path '*hicolor*apps*' \
      \( -name '*.png' -o -name '*.svg' \) 2>/dev/null | head -n1)"
  elif [ -d "${srcdir}/squashfs-root/usr/share/pixmaps" ]; then
    icon_file="$(find "${srcdir}/squashfs-root/usr/share/pixmaps" \
      \( -name '*.png' -o -name '*.svg' \) 2>/dev/null | head -n1)"
  fi

  if [ -n "${icon_file}" ]; then
    case "${icon_file}" in
    *.svg)
      install -Dm644 "${icon_file}" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
      ;;
    *)
      install -Dm644 "${icon_file}" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
      ;;
    esac
  fi
}
