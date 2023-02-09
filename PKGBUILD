# Maintainer: Pfych <contact at pfy dot ch>
pkgname=lr2oraja
pkgver=build1696491429
pkgrel=7
pkgdesc="The latest build of beatoraja, but compiled using LR2 judges and gauges."
arch=('x86_64')
depends=('liberica-jre-8-full-bin')
makedepend=('unzip')
source=(
  "https://github.com/wcko87/lr2oraja/releases/download/${pkgver}/LR2oraja.zip"
  'beatoraja.sh'
  'https://github.com/pfych/lr2oraja-pkgbuild/releases/download/skin/skin.zip'
  'lr2oraja-icon.png'
  'https://github.com/TNG-dev/tachi-beatoraja-ir/releases/download/v2.2.0/bokutachiIR-2.2.0.jar'
)
sha256sums=(
  'f2422e1b59d4d8cfe1c75aea5d1bfdd73e7a55c8afa2830681361766d62ea42c'
  '9c91742aac348b466f7614bb0e8073d85ebdf1efa16b906766082fa9af531a8b'
  'ef23b516537b4f52c306fd61ab9c4197192c06b7202b3b27b63481fec1042a26'
  '0ec1382690cd847055d1b8e6da36ad6846598b45b25acca5eb5e301a5048da03'
  '64bfa08c8f1f4518fe73281963fa3234bfb451551947f91270d2d14e9d621d5d'
)
license=(
  'GPL3'
  'unknown'
  'GPL3'
  'unknown'
  'MIT'
)

prepare() {
  # Beatoraja will fail to load without a default skin
  unzip -o skin.zip
}

build() {
  unzip -o LR2oraja.zip
}

package() {
  # Create required directories
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/beatoraja/ir"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"

  # Move all required Beatoraja Files
  cp beatoraja.jar "$pkgdir/opt/beatoraja/beatoraja.jar" 
  cp -r skin "$pkgdir/opt/beatoraja"
  cp "bokutachiIR-2.2.0.jar" "$pkgdir/opt/beatoraja/ir"
  chmod -R 777 "$pkgdir/opt/beatoraja"

  # Create Desktop entry
  cp lr2oraja-icon.png "$pkgdir/usr/share/pixmaps"
  desktopEntry="$pkgdir/usr/share/applications/lr2oraja.desktop"
  touch "$desktopEntry"
  echo "[Desktop Entry]" >> "$desktopEntry"
  echo "Type=Application" >> "$desktopEntry"
  echo "Terminal=true" >> "$desktopEntry"
  echo "Exec=/usr/bin/beatoraja" >> "$desktopEntry"
  echo "Version=$pkgver" >> "$desktopEntry"
  echo "Name=LR2oraja" >> "$desktopEntry"
  echo "Categories=Games;" >> "$desktopEntry"
  echo "Icon=lr2oraja-icon" >> "$desktopEntry"

  # Create config symlink
  ln -s "$pkgdir/opt/beatoraja" "$XDG_CONFIG_HOME/beatoraja"

  # Install LR2oraja
  install -D beatoraja.sh "$pkgdir/usr/bin/beatoraja"
}
