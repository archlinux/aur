# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=kitch-bin
pkgver=26.4.0
pkgrel=1
pkgdesc="The itch.io desktop app (beta channel) (binary release)"
url="https://itchio.itch.io/kitch"
license=('MIT')
arch=('x86_64')
provides=("kitch")
conflicts=("kitch" "kitch-setup")
depends=('alsa-lib' 'at-spi2-core' 'bash' 'cairo' 'dbus' 'expat' 'glib2'
         'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
optdepends=('firejail: sandbox preference'
            'wine: Windows games')
noextract=("kitch-v$pkgver-canary-linux-amd64.tar.gz")
source=("https://github.com/itchio/itch/releases/download/v$pkgver-canary/kitch-v$pkgver-canary-linux-amd64.tar.gz"
        "https://github.com/itchio/itch/raw/31d8d2f5646f9c6ab93cdd3a8bd1be6f59c687af/LICENSE")
sha256sums=('67347aff523be21c980fcb9e7a177c57d7e361e9050b815c5b4ac35517949e51'
            '747d5f4b6f82e28fbd50e192ee6e977159e4848cb55e0cc6ee04219832932d7c')

prepare() {
  echo "# Creating two symlinks under the HOME directory" && sleep 1
  echo "# to fix the firejail issue, see:" && sleep 1
  echo "# https://github.com/itchio/itch/issues/2732" && sleep 4
  _DIR="$HOME/.config/kitch/prereqs/firejail-amd64"
  _DIR2="$HOME/.config/kitch/prereqs/firejail-386"
  mkdir -p $_DIR $_DIR2
  ln -sf /usr/bin/firejail $_DIR
  ln -sf /usr/bin/firejail $_DIR2

# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=kitch\n\
Comment=The itch.io desktop app (beta channel)\n\
Exec=/opt/kitch/kitch %U\n\
Icon=kitch\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=kitch\n\
Categories=Game;
MimeType=x-scheme-handler/kitchio;x-scheme-handler/kitch;" > kitch.desktop

  mkdir -p $pkgname
  tar -xf kitch-v$pkgver-canary-linux-amd64.tar.gz -C kitch-bin
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/kitch" "$pkgdir/usr/bin"
# Install
  install -Dm644 kitch.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/kitch"
  cd kitch-bin/resources/app/src/static/images
  install -Dm644 tray/kitch.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 window/kitch/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/kitch.png"
  install -Dm644 window/kitch/icon-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/kitch.png"
  mv $srcdir/kitch-bin/* "$pkgdir/opt/kitch"
  ln -s /opt/kitch/kitch "$pkgdir/usr/bin"
}
