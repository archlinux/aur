# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Łukasz Mariański <lmarianski at protonmail dot com>

pkgname=itch-bin
pkgver=26.1.9
pkgrel=3
pkgdesc="The itch.io desktop app (binary release)"
url="https://itchio.itch.io/itch"
license=('MIT')
arch=('x86_64')
provides=("itch")
conflicts=("itch" "itch-setup")
depends=('alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'glib2'
         'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('firejail: sandbox preference'
            'wine: Windows games')
source=("itch-linux-amd64-$pkgver.zip::https://broth.itch.ovh/itch/linux-amd64/$pkgver/archive/default"
        "https://github.com/itchio/itch/raw/31d8d2f5646f9c6ab93cdd3a8bd1be6f59c687af/LICENSE")
sha256sums=('9324777a2edf37d3afaa39b073050c2a5d3a07fec45d21171813af9e6b3fd6a3'
            '747d5f4b6f82e28fbd50e192ee6e977159e4848cb55e0cc6ee04219832932d7c')

prepare() {
  echo "# Creating two symlinks under the HOME directory" && sleep 1
  echo "# to fix the firejail issue, see:" && sleep 1
  echo "# https://github.com/itchio/itch/issues/2732" && sleep 4
  _DIR="$HOME/.config/itch/prereqs/firejail-amd64"
  _DIR2="$HOME/.config/itch/prereqs/firejail-386"
  mkdir -p $_DIR $_DIR2
  ln -sf /usr/bin/firejail $_DIR
  ln -sf /usr/bin/firejail $_DIR2

# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=itch\n\
Comment=The itch.io desktop app\n\
Exec=/opt/itch/itch %U\n\
Icon=itch\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=itch\n\
Categories=Game;
MimeType=x-scheme-handler/itchio;x-scheme-handler/itch;" > itch.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/itch" "$pkgdir/usr/bin"
# Install
  install -Dm644 itch.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/itch"
  install -Dm644 resources/app/src/static/images/tray/itch.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 resources/app/src/static/images/window/itch/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/itch.png"
  install -Dm644 resources/app/src/static/images/window/itch/icon-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/itch.png"
  rm LICENSE itch.desktop itch-linux-amd64-$pkgver.zip
  mv * "$pkgdir/opt/itch"
  ln -s /opt/itch/itch "$pkgdir/usr/bin"
}
