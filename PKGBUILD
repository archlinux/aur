# Maintainer: eddi <support@heyjunior.ai>
pkgname=junior-desktop
pkgver=2.6.2
pkgrel=1
pkgdesc="The desktop app for Junior"
arch=('x86_64')
url="https://github.com/Andrew-AI-JR/Desktop-Releases"
license=('ISC')
depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
)
optdepends=(
  'libappindicator-gtk3: for system tray support'
)
makedepends=('imagemagick')
options=('!strip' '!emptydirs')
_source_name="${pkgname}_${pkgver}_amd64"
source=(
  "${_source_name}.deb::https://github.com/Andrew-AI-JR/Desktop-Releases/releases/download/v${pkgver}/${_source_name}.deb"
)
sha256sums=('0e8c65370ce6ac5300d8c22c5d360918be98c1ae5e912643728262afdacffbee')

prepare() {
  bsdtar -xf "${_source_name}.deb"
}

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
exec /opt/Junior/junior-desktop --gtk-version=3 "\$@"
EOF

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Junior
Comment=The desktop app for Junior
Exec=/usr/bin/${pkgname} %U
Icon=${pkgname}
Terminal=false
Type=Application
StartupWMClass=Junior
Categories=Utility;
EOF

  _icon="${pkgdir}/usr/share/icons/hicolor/0x0/apps/${pkgname}.png"
  if [[ -f "${_icon}" ]]; then
    _sizes=(512x512 256x256 128x128 64x64 48x48 32x32 16x16)
    for _size in "${_sizes[@]}"; do
      install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
      magick "${_icon}" -resize "${_size}" -quality 100 \
        "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
    done
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    rm -rf "${pkgdir}/usr/share/icons/hicolor/0x0"
  fi

  chmod 4755 "${pkgdir}/opt/Junior/chrome-sandbox"
}
