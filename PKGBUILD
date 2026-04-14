# Maintainer: Amin Aimeur <m.amin.aimeur@gmail.com>
pkgname=echonoting-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="AI meeting notes with live transcription"
arch=('x86_64')
url="https://github.com/AimeurAmin/echonoting-releases"
license=('MIT')
depends=('webkit2gtk-4.1' 'libpulse' 'alsa-lib' 'fuse2')
# !strip   — do NOT run `strip` on files. AppImages are ELF runtime + squashfs
#            payload concatenated. Running strip on the outer ELF truncates
#            the squashfs and produces a broken ~945KB stub.
# !debug   — do NOT split a -debug package. The AppImage has its own bundled
#            binary; we don't want makepkg touching debug sections.
options=('!strip' '!debug')
provides=('echonoting')
conflicts=('echonoting')
source=("EchoNoting_0.4.0_amd64.AppImage::https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v${pkgver}/EchoNoting_0.4.0_amd64.AppImage")
sha256sums=('d0ce423f6851dfd42e0925e1e9febe2e5d0aa7581bf96aa81e38c67de0255d37')
noextract=("EchoNoting_0.4.0_amd64.AppImage")

package() {
  install -Dm755 "${srcdir}/EchoNoting_0.4.0_amd64.AppImage" \
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
  chmod +x "EchoNoting_0.4.0_amd64.AppImage"
  ./"EchoNoting_0.4.0_amd64.AppImage" --appimage-extract '*.png' >/dev/null 2>&1 || true
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
