# Maintainer: 3ri4nG0ld <brianldg92@gmail.com>
pkgname=epixnet-bin
_pkgname=epixnet
pkgver=0.6.11
pkgrel=1
pkgdesc="Decentralized peer-to-peer web platform (official binary AppImage release)"
arch=('x86_64')
url="https://github.com/EpixZone/EpixNet"
license=('MIT')
depends=(
  'fuse2'
  'glibc'
  'zlib'
)
optdepends=(
  'libayatana-appindicator: system tray icon support'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-git")
options=('!strip' '!debug')

_appimage="EpixNet-${pkgver}-${CARCH}.AppImage"
source_x86_64=(
  "${_appimage}::https://github.com/EpixZone/EpixNet/releases/download/v${pkgver}/${_appimage}"
)
sha256sums_x86_64=('60328b8f134bd2ea286734abcc4008599f880c8574cac9440129c94d826b547a')
noextract=("${_appimage}")

prepare() {
  cd "${srcdir}"
  chmod +x "${_appimage}"
  # Extract desktop file and icons from the AppImage
  ./"${_appimage}" --appimage-extract "epix.desktop" 2>/dev/null || ./"${_appimage}" --appimage-extract 2>/dev/null || true
  ./"${_appimage}" --appimage-extract "usr/share/icons/*" 2>/dev/null || true
  ./"${_appimage}" --appimage-extract "LICENSE*" 2>/dev/null || true
}

package() {
  cd "${srcdir}"

  # Install AppImage to /opt/epixnet
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

  # Executable symlinks in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/epix-browser"

  # Desktop integration
  if [ -f "squashfs-root/epix.desktop" ]; then
    install -Dm644 "squashfs-root/epix.desktop" "${pkgdir}/usr/share/applications/epix.desktop"
    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %u|" "${pkgdir}/usr/share/applications/epix.desktop"
  else
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/epix.desktop" <<EOF
[Desktop Entry]
Name=EpixNet
Comment=Browse the decentralized web
Exec=/usr/bin/${_pkgname} %u
Icon=epix
Type=Application
Terminal=false
Categories=Network;WebBrowser;
MimeType=x-scheme-handler/epix;
StartupWMClass=EpixNet
StartupNotify=true
EOF
  fi

  # Icons
  if [ -d "squashfs-root/usr/share/icons" ]; then
    cp -a "squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  fi

  # License
  if [ -f "squashfs-root/LICENSE" ]; then
    install -Dm644 "squashfs-root/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    echo "MIT License - EpixNet" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
