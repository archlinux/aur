# Maintainer: Amos Wenger <amos@itch.io>
# Contributor: FrozenCow <frozencow@gmail.com>

pkgname=kitch
pkgver=1.14.0
pkgrel=2
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/kitch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'libxss' 'gtk3')
makedepends=('curl')
options=('!strip')
install="kitch.install"

[ "$CARCH" = "i686" ]   && _ITCH_ARCH=386;
[ "$CARCH" = "x86_64" ] && _ITCH_ARCH=amd64;

source=("https://github.com/itchio/itch/archive/v25.4.0.tar.gz")
sha256sums=('e86c70044c7d02754c6e52fb428d1278678d729c77b8359b5d82198595da1351')

prepare() {
  curl --fail --location --output kitch-setup "https://broth.itch.ovh/kitch-setup/linux-${_ITCH_ARCH}/${pkgver}/unpacked/default"
}

package() {
  install -Dm755 kitch-setup "${pkgdir}/usr/bin/kitch-setup"

  cat << BE_KIND > kitch
#!/bin/sh
kitch-setup --prefer-launch -- "@$"
BE_KIND
  install -Dm755 kitch "${pkgdir}/usr/bin/kitch"

  cat << BE_PATIENT > io.itch.kitch.desktop
[Desktop Entry]
Type=Application
Name=kitch
TryExec=kitch
Exec=kitch %U
Icon=kitch
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/kitchio;x-scheme-handler/kitch;
X-GNOME-Autostart-enabled=true
Comment=Install and play itch.io games easily
BE_PATIENT
  install -Dm644 io.itch.kitch.desktop "${pkgdir}/usr/share/applications/io.itch.kitch.desktop"

  cd "${srcdir}/itch-25.4.0"

  for icon in release/images/kitch-icons/icon*.png
  do
    iconsize="${icon#release/images/kitch-icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="${pkgdir}/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/kitch.png"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
