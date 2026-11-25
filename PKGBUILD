# Maintainer: Vitaliy VVS Star <vitaliy <dot> star <at> Gmail-DOT-Com>

pkgname=phonebox-bin
pkgver=0.9.29
pkgrel=1
pkgdesc='Turn an old Android phone into a desk panel: PC stats, media and touch controls over USB or Wi-Fi (desktop agent)'
arch=('x86_64' 'aarch64')
url='https://github.com/ersinkoc/phonebox'
license=('MIT')
# strip corrupts the .NET single-file bundle
options=('!strip')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme')
optdepends=('playerctl: Now Playing widget and media controls'
            'libpulse: volume control (pactl)'
            'wireplumber: volume control (wpctl)'
            'android-tools: install the phone app and connect over USB (adb)'
            'xprintidle: idle detection')
source=('phonebox.png')
source_x86_64=("${pkgname}-${pkgver}.zip::https://github.com/ersinkoc/phonebox/releases/download/v${pkgver}/PhoneBoxAgent-${pkgver}-linux-x64.zip"
               "LICENSE::https://raw.githubusercontent.com/ersinkoc/phonebox/v${pkgver}/LICENSE")
source_aarch64=("${pkgname}-${pkgver}.zip::https://github.com/ersinkoc/phonebox/releases/download/v${pkgver}/PhoneBoxAgent-${pkgver}-linux-arm64.zip"
                "LICENSE::https://raw.githubusercontent.com/ersinkoc/phonebox/v${pkgver}/LICENSE")
sha256sums=('4048d51d6c94e80efbec083eb144f7e113428c6b1715c019f80abc7a47e1392f')
sha256sums_x86_64=('5b5e3a0669362d57dc4b89f44e57db4570ee622c6950e11812778fd96e05d40f'
                   'e3cfb97b744f8391177244cd991b126875adac85d13b76d526a5fd603fcb548b')
sha256sums_aarch64=('5808fbb723ca0894d3fa579809f4c83f0556b5a712a5c45db915119b96c6c2d3'
                    'e3cfb97b744f8391177244cd991b126875adac85d13b76d526a5fd603fcb548b')

package() {
  cd "$srcdir"

  _dest="$pkgdir/usr/lib/phonebox"
  install -d "$_dest"
  install -m755 PhoneBoxAgent -t "$_dest"
  install -m644 config.default.json config.default.linux.json config.default.macos.json \
    templates.json widgets.json PhoneBoxAgent.staticwebassets.endpoints.json \
    THIRD-PARTY-NOTICES.txt -t "$_dest"

  # the agent resolves its config files relative to its own path, so expose a wrapper instead of a symlink
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/phonebox" <<'EOF'
#!/bin/sh
exec /usr/lib/phonebox/PhoneBoxAgent "$@"
EOF

  install -Dm644 phonebox.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/phonebox.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/phonebox.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=PhoneBox
Comment=Desk panel agent for an Android phone
Exec=phonebox
Icon=phonebox
Terminal=false
Categories=Network;Utility;
EOF

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
