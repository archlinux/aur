# Maintainer: Paragoumba <paragoumba@protonmail.com>
# Contributor: Amos Wenger <amos@itch.io>

pkgname=itch
pkgver=1.26.0
pkgrel=2
epoch=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/itch"
license=('MIT')

depends=('libnotify' 'nss' 'libxss' 'gtk3')
optdepends=('wine: launch windows games')
options=('!strip')
install="itch.install"

_ITCH_VER=25.5.1

[ "$CARCH" = "i686" ]   && _ITCH_ARCH=386;
[ "$CARCH" = "x86_64" ] && _ITCH_ARCH=amd64;

source=(
  "https://github.com/itchio/itch/archive/v${_ITCH_VER}.tar.gz"
  "itch-setup::https://broth.itch.ovh/itch-setup/linux-${_ITCH_ARCH}/${pkgver}/unpacked/default")
sha256sums=('0a7094bff90992e3788fd9f9df43a4a3c9233bfcf0f5da037e59af6b365a3249'
            'c7a13db7234ca908bcfb60ed5369b5c02b0a795e5e5490f68eeacb5a637a2162')

package() {
  install -Dm755 itch-setup "${pkgdir}/usr/bin/itch-setup"

  cat << 'BE_KIND' > itch
#!/bin/sh
itch-setup --prefer-launch -- "$@"
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
