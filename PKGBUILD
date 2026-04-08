# Maintainer: Amin Aimeur <m.amin.aimeur@gmail.com>
pkgname=echonoting-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="AI meeting notes with live transcription"
arch=('x86_64')
url="https://github.com/AimeurAmin/echonoting"
license=('MIT')
depends=('webkit2gtk-4.1' 'libpulse' 'alsa-lib' 'fuse2')
provides=('echonoting')
conflicts=('echonoting')
source=("echonoting_0.2.4_amd64.AppImage::https://github.com/AimeurAmin/echonoting/releases/download/desktop-v${pkgver}/echonoting_0.2.4_amd64.AppImage")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
noextract=("echonoting_0.2.4_amd64.AppImage")

package() {
  install -Dm755 "${srcdir}/echonoting_0.2.4_amd64.AppImage" \
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
  chmod +x "echonoting_0.2.4_amd64.AppImage"
  ./"echonoting_0.2.4_amd64.AppImage" --appimage-extract '*.png' >/dev/null 2>&1 || true
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
