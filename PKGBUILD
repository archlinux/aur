# Maintainer: Pfych <contact at pfy dot ch>
pkgname=lr2oraja-endlessdream
pkgver=0.1.1
_basever=0.8.6
pkgrel=1
pkgdesc="A featureful fork of beatoraja."
arch=('x86_64')
depends=('liberica-jre-8-full-bin' 'portaudio')
makedepend=('unzip')
source=(
  "https://github.com/seraxis/lr2oraja-endlessdream/releases/download/v0.1.1/lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar"
  'https://github.com/pfych/lr2oraja-pkgbuild/releases/download/skin/skin.zip'
  'https://github.com/TNG-dev/tachi-beatoraja-ir/releases/download/v3.0.0/bokutachiIR-3.0.0.jar'
  'libjportaudio.so'
  'lr2oraja-endlessdream.sh'
  'lr2oraja-endlessdream-icon.png'
)
sha256sums=(
  'd09e8b3838b29e702edc8ad42aa49b323f722ac42d0180451a12f530fb61655c' # LR2oraja-endlessdream.jar
  'ef23b516537b4f52c306fd61ab9c4197192c06b7202b3b27b63481fec1042a26' # skin.zip
  '3754959d5d6f121dbeed3a78dec2b91a26e915ff4ce68fdee4262b89ad150cb9' # bokutachiIR
  'a65d1290d3ee7710f9327c040e6369bf7587eb3609835ed782caaf0ac02d84ed' # libjportaudio.so
  '539d037783b9689cf108088b8e23b1713a3baba51465fba2983e182849619ed9' # lr2oraja-endlessdream.sh
  'fdbd37ff43aa6af20f9eb643bf271a77ef579014970a7a3dcecf78e65123d83d' # lr2oraja-endlessdream-icon.png
)
license=(
  'GPL3'
  'GPL3'
  'MIT'
  'unknown'
  'unknown'
)

prepare() {
  # Beatoraja will fail to load without a default skin
  unzip -o skin.zip
}

package() {
  # Create required directories
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/lr2oraja-endlessdream/ir"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"

  # Move all required Beatoraja Files
  cp libjportaudio.so "$pkgdir/usr/lib"
  cp "lr2oraja-${_basever}-endlessdream-linux-${pkgver}.jar" "$pkgdir/opt/lr2oraja-endlessdream/LR2oraja-endlessdream.jar" 
  cp -r skin "$pkgdir/opt/lr2oraja-endlessdream"
  cp "bokutachiIR-3.0.0.jar" "$pkgdir/opt/lr2oraja-endlessdream/ir"
  chmod -R 777 "$pkgdir/opt/lr2oraja-endlessdream"

  # Create Desktop entry
  cp lr2oraja-endlessdream-icon.png "$pkgdir/usr/share/pixmaps"
  desktopEntry="$pkgdir/usr/share/applications/lr2oraja-endlessdream.desktop"
  touch "$desktopEntry"
  echo "[Desktop Entry]" >> "$desktopEntry"
  echo "Type=Application" >> "$desktopEntry"
  echo "Terminal=true" >> "$desktopEntry"
  echo "Exec=/usr/bin/lr2oraja-endlessdream" >> "$desktopEntry"
  echo "Version=$pkgver" >> "$desktopEntry"
  echo "Name=LR2oraja Endless Dream" >> "$desktopEntry"
  echo "Categories=Games;" >> "$desktopEntry"
  echo "Icon=lr2oraja-icon-endlessdream" >> "$desktopEntry"
  
  if [ -z "$XDG_CONFIG_HOME" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
  fi

  # Create config symlink
  ln -sfn "$pkgdir/opt/lr2oraja-endlessdream" "$XDG_CONFIG_HOME/lr2oraja-endlessdream"

  # Install LR2oraja
  install -D lr2oraja-endlessdream.sh "$pkgdir/usr/bin/lr2oraja-endlessdream"
}
