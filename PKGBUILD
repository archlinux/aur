# Maintainer: Amos Wenger <amos@itch.io>

pkgname=itch
pkgver=1.14.0
pkgrel=3
epoch=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/itch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'libxss' 'gtk3')
makedepends=('curl')
options=('!strip')
install="itch.install"

[ "$CARCH" = "i686" ]   && _ITCH_ARCH=386;
[ "$CARCH" = "x86_64" ] && _ITCH_ARCH=amd64;

source=(
  "https://github.com/itchio/itch/archive/v25.4.0.tar.gz"
  "itch-setup::https://broth.itch.ovh/itch-setup/linux-${_ITCH_ARCH}/${pkgver}/unpacked/default")
sha256sums=('e86c70044c7d02754c6e52fb428d1278678d729c77b8359b5d82198595da1351'
            'b68249a309aff7e929bb2579ba9114dc2369535ce3cdbcf926f9b2ced2f2368b')

package() {
  install -Dm755 itch-setup "${pkgdir}/usr/bin/itch-setup"

  cat << BE_KIND > itch
#!/bin/sh
itch-setup --prefer-launch -- "@$"
BE_KIND
  install -Dm755 itch "${pkgdir}/usr/bin/itch"

  cat << BE_PATIENT > io.itch.itch.desktop
[Desktop Entry]
Type=Application
Name=itch
TryExec=itch
Exec=itch %U
Icon=itch
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/itchio;x-scheme-handler/itch;
X-GNOME-Autostart-enabled=true
Comment=Install and play itch.io games easily
BE_PATIENT
  install -Dm644 io.itch.itch.desktop "${pkgdir}/usr/share/applications/io.itch.itch.desktop"

  cd "${srcdir}/itch-25.4.0"

  for icon in release/images/itch-icons/icon*.png
  do
    iconsize="${icon#release/images/itch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
