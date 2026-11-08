# Maintainer: Đặng Trần Quang Minh <minh0608.dtqm@gmail.com>

pkgname=wuwa-tappo-global-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Unofficial native Linux port of Wuwa Tappo (Global)"
arch=('x86_64')
url="https://github.com/mrunknown850/wuwa-tappo-linux"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'gtk-layer-shell' 'libappindicator-gtk3' 'hicolor-icon-theme')
makedepends=('rust' 'nodejs' 'npm' '7zip')

source=(
  "project-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  "installer.exe::https://wutheringwaves-wuwatappo.kurogames-global.com/app/bcea8e4b-6805-407e-af8d-a45a26bc3727/WuwaTappo-global_${pkgver}_x64-setup.exe"
)
sha256sums=(
  '3cdcbe15d2d7887afbe5f90a1c2ead9702aae1a17ed1382f709a5ab094f54ee0'
  '674d4932c1fa1818406246669d2ab4027a8f70dbca6f365755b23210678d7ff5'
)

noextract=("installer.exe")

options=('!lto')
build() {
  cd "$srcdir/wuwa-tappo-linux-${pkgver}"
  ./build.sh "$srcdir/installer.exe"
}

package() {
  cd "$srcdir/wuwa-tappo-linux-${pkgver}"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm755 bin/wuwatappo-linux \
    "$pkgdir/usr/lib/$pkgname/bin/wuwatappo-linux"
  install -Dm755 run.sh \
    "$pkgdir/usr/lib/$pkgname/run.sh"

  install -d "$pkgdir/usr/bin"

  cat >"$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/usr/bin/env bash
exec /usr/lib/wuwa-tappo-global-bin/run.sh "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/$pkgname"

  # Icon
  install -Dm644 frontend/app-icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # SHORTCUT AND LINKS
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Wuwa Tappo Global
Comment=Unofficial Linux port of the Wuwa Tappo desktop pet
Exec=wuwa-tappo-global-bin
Icon=wuwa-tappo-global-bin
Terminal=false
Categories=Utility;
Keywords=wuwa;wuthering waves;desktop pet;tappo;
EOF
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/$pkgname-url.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Wuwa Tappo Global (login callback)
Exec=/usr/lib/wuwa-tappo-global-bin/bin/wuwatappo-linux %u
NoDisplay=true
MimeType=x-scheme-handler/wuwa-buddy;
EOF

}
