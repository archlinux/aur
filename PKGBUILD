# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Łukasz Mariański <lmarianski at protonmail dot com>

pkgname=itch-bin
pkgver=26.15.0
pkgrel=2
pkgdesc="🎮 The best way to play your itch.io games (binary release)"
url="https://github.com/itchio/itch"
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
noextract=("itch-v$pkgver-linux-amd64.tar.gz")
source=("$url/releases/download/v$pkgver/itch-v$pkgver-linux-amd64.tar.gz")
sha256sums=('efbfee645a29bb2f4d3347817db3348b42d114760f325d72371dfcae4e2e4841')

prepare() {
# Create the desktop file
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
# Extract files into a folder
  tar -xf itch-v$pkgver-linux-amd64.tar.gz --one-top-level=itch-$pkgver
}

package() {
  _icon=usr/share/icons/hicolor
# Create directories
  mkdir -p "$pkgdir/opt/itch" "$pkgdir/usr/bin"
# Install
  install -Dm644 itch.desktop -t "$pkgdir/usr/share/applications"
  cd itch-$pkgver
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/itch"
  cd resources/app/src/static/images
  install -Dm644 tray/itch.png -t "$pkgdir/$_icon/256x256/apps"
  install -Dm644 window/itch/icon.png "$pkgdir/$_icon/128x128/apps/itch.png"
  install -Dm644 window/itch/icon-32.png "$pkgdir/$_icon/32x32/apps/itch.png"
  mv "${srcdir}"/itch-$pkgver/* "$pkgdir/opt/itch"
  ln -s /opt/itch/itch "$pkgdir/usr/bin"
}
