# Maintainer: Fred BotAIro

pkgname=mpf3
pkgver=5.10.019
pkgrel=1
pkgdesc="Local and network music player/control point with UPnP/DLNA, SMB and gapless playback"
arch=('any')
url="https://planetmpf3.penguiner.eu/"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-gobject'
  'gtk3'
  'webkit2gtk-4.1'
  'python-mutagen'
  'python-smbprotocol'
  'ffmpeg'
  'smbclient'
  'avahi'
  'zenity'
)
optdepends=(
  'nss-mdns: mDNS hostname resolution on compatible networks'
)
source=("https://penguiner.eu/planetmpf3/downloads/mpf3-5.10.019.tar.gz")
sha256sums=('d68fa038f9aabf02186cb381c7945eca7919dcafe6c52af12967feaa012ec46d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/lib/mpf3"
  install -m644 mp3f.py mp3f_gtk.py fredplayer_stitch_engine_v0_3.py     "${pkgdir}/usr/lib/mpf3/"
  cp -a assets "${pkgdir}/usr/lib/mpf3/"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/mpf3" <<'LAUNCHER'
#!/usr/bin/env bash
exec /usr/bin/python /usr/lib/mpf3/mp3f_gtk.py "$@"
LAUNCHER

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/mpf3.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=MPF³
Comment=Bibliothèque musicale et Control Point réseau
Exec=mpf3
TryExec=mpf3
Icon=mpf3
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupNotify=true
DESKTOP

  for size in 64 128 256 512; do
    install -Dm644 "assets/mpf3-${size}.png"       "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/mpf3.png"
  done

  install -Dm644 README.md "${pkgdir}/usr/share/doc/mpf3/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/mpf3/LICENSE"
}
