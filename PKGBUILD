# Maintainer: nero4kan <vegomdoster@gmail.com>

_meta_url="https://raw.githubusercontent.com/nerolocker/whitemusic/refs/heads/main/update.json"

pkgname=white-music-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="White Music — Yandex Music mod with clean UI"
arch=('x86_64')
url="https://github.com/nerolocker/whitemusic"
license=('MIT')
depends=('nss' 'alsa-lib' 'gtk3' 'libxss' 'libnm')
provides=('white-music')
conflicts=('white-music')
source=("$_meta_url")
sha256sums=('SKIP')

prepare() {
  local _dlurl
  _dlurl=$(python3 -c "import json; print(json.load(open('update.json'))['url'])")
  if [ -z "$_dlurl" ]; then
    _dlurl="https://github.com/nerolocker/whitemusic/releases/download/Release/white-music.tar.gz"
  fi
  curl -L -o "$srcdir/white-music.tar.gz" "$_dlurl"
}

package() {
  cd "$srcdir"
  tar -xzf white-music.tar.gz

  install -dm755 "$pkgdir/opt/$pkgname"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"

  cp -r white-music/. "$pkgdir/opt/$pkgname/"

  ln -s "/opt/$pkgname/whitemusic" "$pkgdir/usr/bin/white-music"

  cat <<EOF > "$pkgdir/usr/share/applications/white-music.desktop"
[Desktop Entry]
Name=White Music
Comment=Yandex Music mod with clean UI
Exec=white-music %U
Terminal=false
Type=Application
Icon=/opt/$pkgname/resources/assets/icons/icon_48x48.png
Categories=AudioVideo;Audio;Player;
EOF

  chmod 644 "$pkgdir/usr/share/applications/white-music.desktop"
}
