# Maintainer: Kiru <oss@kiru.app>

pkgname=kiru-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Transcription-driven video editor"
arch=('x86_64')
url="https://kiru.app"
license=('custom')
depends=(
  'alsa-lib'
  'ffmpeg'
  'fontconfig'
  'mediainfo'
  'perl-image-exiftool'
  'ttf-ibm-plex'
  'xdg-utils'
  'zenity'
)
optdepends=('kdialog: alternative file dialog backend on KDE')
provides=('kiru')
conflicts=('kiru')
options=('!strip')
source=(
  "Kiru-${pkgver}-linux-${CARCH}-arch.tar.gz::https://releases.getkiru.app/releases/linux/Kiru-0.5.2-linux-${CARCH}-arch.tar.gz"
  'kiru.desktop'
  'kiru.png'
  'kiru.svg'
  'LICENSE'
)
sha256sums=(
  '85689f9f576f33195f330476df6816794a70eea78331a8a96d49c53e2315b723'
  'b9ccd131ad127061eae3b05b53c566e78ca25243155c2b03bb7546e5be5defe0'
  '356ce1144dedad29ecf4a180761b83b2d826322ba25d9203c75e7570f574b364'
  '2935a0fe9651a84fded9c0fcd10122803f0935e0cd27f2d76dc96a3209af8cae'
  '8aaa0695e81583c4d560a3b900baea662eaf1fa99b4339b00ad434ebb8dc5518'
)

package() {
  install -dm755 "$pkgdir/opt/kiru"
  cp -a kiru/. "$pkgdir/opt/kiru/"

  install -Dm644 kiru.desktop "$pkgdir/usr/share/applications/kiru.desktop"
  install -Dm644 kiru.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/kiru.png"
  install -Dm644 kiru.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kiru.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/kiru" <<'EOF'
#!/usr/bin/env bash
export KIRU_FFMPEG_PATH="${KIRU_FFMPEG_PATH:-$(command -v ffmpeg)}"
export KIRU_FFPROBE_PATH="${KIRU_FFPROBE_PATH:-$(command -v ffprobe)}"
export KIRU_INSTALL_CHANNEL="${KIRU_INSTALL_CHANNEL:-aur}"
exec /opt/kiru/AppRun "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/kiru"
}
