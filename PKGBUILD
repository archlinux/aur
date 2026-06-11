pkgname=extera-next-bin
pkgver=26.2.83
pkgrel=1
pkgdesc="A feature-rich Matrix client made in Flutter"
arch=('x86_64')
url="https://github.com/ExteraApp/Extera"
license=('AGPL-3.0-only')
provides=('extera-next')
conflicts=('extera-next')
depends=(
  'gtk3'
  'libsecret'
  'libkeybinder3'
  'openssl'
  'webkit2gtk-4.1'
  'xdg-user-dirs'
)
makedepends=('curl')
source=(
  "bundle.tar.gz::https://extera.xyz/next/bundle.tar.gz"
)
sha256sums=('SKIP')

pkgver() {
  curl -s "https://raw.githubusercontent.com/ExteraApp/Extera/main/pubspec.yaml" \
    | sed -n 's/^version: \([^+]*\).*/\1/p'
}

package() {
  cd "$srcdir/bundle"

  install -d "$pkgdir/usr/lib/extera_next"
  cp -r ./* "$pkgdir/usr/lib/extera_next/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/extera_next/extera_next "$pkgdir/usr/bin/extera-next"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/extera-next.desktop" <<EOF
[Desktop Entry]
Name=extera-next
Comment=A feature-rich Matrix client made in Flutter
Exec=extera-next
Icon=extera
Type=Application
MimeType=x-scheme-handler/matrix;
StartupWMClass=extera_next
Terminal=false
Categories=Network;Chat;InstantMessaging;X-Matrix;
EOF

  if [ -f "$srcdir/bundle/data/flutter_assets/assets/logo.png" ]; then
    install -Dm644 "$srcdir/bundle/data/flutter_assets/assets/logo.png" \
      "$pkgdir/usr/share/pixmaps/extera.png"
  fi
}
