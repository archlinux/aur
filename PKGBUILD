# Maintainer: Kristyan Carvalho <kristyancarvalho@hotmail.com>

pkgname=desktube-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Control YouTube on your computer from your phone, over your local network"
arch=('x86_64')
url="https://github.com/kristyancarvalho/desktube"
license=('MPL-2.0')
provides=('desktube')
conflicts=('desktube')
depends=('gtk3' 'nss' 'alsa-lib' 'libxtst' 'libnotify')
options=('!strip' '!debug')
source=("DeskTube-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/DeskTube-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('7735779fdee858930dc187932ac9bf39139c2d86ef5357fd2e92e3d4bea36887')

package() {
  local appdir
  appdir="$(dirname "$(find "$srcdir" -maxdepth 3 -type f -name desktube -print -quit)")"

  install -dm755 "$pkgdir/opt/desktube"
  cp -a "$appdir"/. "$pkgdir/opt/desktube/"

  if [ -e "$pkgdir/opt/desktube/chrome-sandbox" ]; then
    chmod 4755 "$pkgdir/opt/desktube/chrome-sandbox"
  fi

  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/desktube" <<'EOF'
#!/bin/sh
exec /opt/desktube/desktube "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/desktube"

  install -dm755 "$pkgdir/usr/share/applications"
  cat >"$pkgdir/usr/share/applications/desktube.desktop" <<'EOF'
[Desktop Entry]
Name=DeskTube
GenericName=YouTube Remote
Comment=Control YouTube on your computer from your phone
Exec=desktube %U
Icon=desktube
Terminal=false
Type=Application
Categories=AudioVideo;Network;
Keywords=youtube;remote;video;player;
StartupWMClass=DeskTube
EOF

  if [ -e "$pkgdir/opt/desktube/resources/icon.png" ]; then
    install -Dm644 "$pkgdir/opt/desktube/resources/icon.png" \
      "$pkgdir/usr/share/icons/hicolor/512x512/apps/desktube.png"
  fi

  local res="$pkgdir/opt/desktube/resources"
  if [ -e "$res/LICENSE" ]; then
    install -Dm644 "$res/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  if [ -e "$res/NOTICE" ]; then
    install -Dm644 "$res/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
  fi
  if [ -e "$res/THIRD_PARTY_NOTICES.md" ]; then
    install -Dm644 "$res/THIRD_PARTY_NOTICES.md" \
      "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  fi
}
