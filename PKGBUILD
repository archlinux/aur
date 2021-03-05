# Maintainer: Paragoumba <paragoumba@protonmail.com>
# Contributor: Amos Wenger <amos@itch.io>

pkgname=itch
pkgver=1.24.0
pkgrel=5
epoch=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/itch"
license=('MIT')

depends=('libnotify' 'nss' 'libxss' 'gtk3')
options=('!strip')
install="itch.install"

_ITCH_VER=25.4.1

[ "$CARCH" = "i686" ]   && _ITCH_ARCH=386;
[ "$CARCH" = "x86_64" ] && _ITCH_ARCH=amd64;

source=(
  "https://github.com/itchio/itch/archive/v${_ITCH_VER}.tar.gz"
  "itch-setup::https://broth.itch.ovh/itch-setup/linux-${_ITCH_ARCH}/${pkgver}/unpacked/default")
sha256sums=('64152877a7a75485ff6ec904502fb8c9a57f655d2956d4a93131af2cf999a5d3'
            'efd8ac1f8e3f7695992742f3b95aa54453bce5be358c820ee3d42ef07080d06d')

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

  cd "${srcdir}/itch-${_ITCH_VER}"

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
