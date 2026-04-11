# Maintainer: Amin Aimeur <m.amin.aimeur@gmail.com>
pkgname=echonoting-bin
pkgver=0.3.0
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
source=("EchoNoting_0.3.0_amd64.AppImage::https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v${pkgver}/EchoNoting_0.3.0_amd64.AppImage")
sha256sums=('c6091ec5750431f15c8e3859bb71fd88bb2dbb04da182c322128180303988544')
noextract=("EchoNoting_0.3.0_amd64.AppImage")

package() {
  install -Dm755 "${srcdir}/EchoNoting_0.3.0_amd64.AppImage" \
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
  chmod +x "EchoNoting_0.3.0_amd64.AppImage"
  ./"EchoNoting_0.3.0_amd64.AppImage" --appimage-extract '*.png' >/dev/null 2>&1 || true
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
