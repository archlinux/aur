# Maintainer: Amin Aimeur <m.amin.aimeur@gmail.com>
pkgname=echonoting-bin
pkgver=0.2.8
pkgrel=2
pkgdesc="AI meeting notes with live transcription"
arch=('x86_64')
url="https://github.com/AimeurAmin/echonoting-releases"
license=('MIT')
depends=('webkit2gtk-4.1' 'libpulse' 'alsa-lib' 'fuse2')
options=('!strip' '!debug')
provides=('echonoting')
conflicts=('echonoting')
source=("EchoNoting_0.2.8_amd64.AppImage::https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v${pkgver}/EchoNoting_0.2.8_amd64.AppImage")
sha256sums=('e218df9f5138374c9f62341ff8e70436ce9f10ae4585bcd4088bdcad6d6ce363')
noextract=("EchoNoting_0.2.8_amd64.AppImage")

package() {
  install -Dm755 "${srcdir}/EchoNoting_0.2.8_amd64.AppImage" \
    "${pkgdir}/opt/echonoting/EchoNoting.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/echonoting/EchoNoting.AppImage "${pkgdir}/usr/bin/echonoting"

  install -dm755 "${pkgdir}/usr/share/applications"
  printf '%s\n' \
    '[Desktop Entry]' \
    'Type=Application' \
    'Name=EchoNoting' \
    'Comment=AI meeting notes with live transcription' \
    'Exec=/opt/echonoting/EchoNoting.AppImage %U' \
    'Icon=echonoting' \
    'Terminal=false' \
    'Categories=Office;AudioVideo;' \
    'StartupWMClass=EchoNoting' \
    'MimeType=x-scheme-handler/echonoting;' \
    > "${pkgdir}/usr/share/applications/echonoting.desktop"

  # Extract the bundled icon from the AppImage so the launcher shows it
  cd "${srcdir}"
  chmod +x "EchoNoting_0.2.8_amd64.AppImage"
  ./"EchoNoting_0.2.8_amd64.AppImage" --appimage-extract '*.png' >/dev/null 2>&1 || true
  if [ -d squashfs-root ]; then
    ICON=$(find squashfs-root -iname 'echonoting*256*.png' 2>/dev/null | head -1)
    if [ -z "$ICON" ]; then
      ICON=$(find squashfs-root -iname 'echonoting*.png' 2>/dev/null | head -1)
    fi
    if [ -n "$ICON" ]; then
      install -Dm644 "$ICON" "${pkgdir}/usr/share/pixmaps/echonoting.png"
    fi
    rm -rf squashfs-root
  fi
}
