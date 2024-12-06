# Maintainer: zt <zt@zt64.dev>
# Maintainer: cookie <kyliepc@proton.me>
_pkgname=Vesktop
_name=vesktop
pkgname=vesktop-electron
pkgdesc="An Electron-based Discord app with Vencord & improved Linux support using system provided electron. Unsupported"
pkgver=1.5.4
pkgrel=1

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')

depends=('electron')
makedepends=('nodejs>=18')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vesktop")
conflicts=('vesktop')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/Vencord/Vesktop/archive/v${pkgver}.tar.gz" "vesktop.desktop" "vesktop.sh" "afterPack.js")

sha256sums=('ad43c34a8623ceee9565b41bc0f7cc7ffa3a105d73c0620cc9ed4ab8b416c728'
            'c7845033716d7fdec2ea1daf8c3575b504bc6a5c19c702e3722a0e6237ae571f'
            '58c61ef14e5eaefe7207a6b66b065973a6002a2ae1d0fb9fd8ec2d2c2b198607'
            '122b17ce996318e533e6f2ab1c9b2961b39c3eba271c9b40f10c0da5dd738baa')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Add unpacked icon extraction script
  sed -i '/"beforePack": "scripts\/build\/sandboxFix.js",/a\ \ \ \ \ \ \ \ "afterPack": "'$srcdir'/afterPack.js",' package.json

  # Use system's electron
  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/electron\",\n/" package.json

  corepack pnpm i
  corepack pnpm build
  corepack pnpx electron-builder --dir
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Create necessary directories
  install -d "$pkgdir/usr/lib/$_name"
  install -d "$pkgdir/usr/bin"

  cp "dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$_name"

  install -Dm644 "../vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop" # Install desktop entry
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Install license
  for _icons in 1024 512 256 128 64 48 32 16; do
    install -Dm644 "dist/.icon-set/icon_${_icons}.png" "$pkgdir/usr/share/icons/hicolor/${_icons}x${_icons}/apps/$_name.png"
  done # Install icons

  install -Dm755 "../vesktop.sh" "$pkgdir/usr/bin/$_name" # Start script
}
