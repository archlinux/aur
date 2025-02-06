# Maintainer: zt <zt@zt64.dev>
# Maintainer: cookie <kyliepc@proton.me>
_pkgname=Vesktop
_name=vesktop
pkgname=vesktop-electron
pkgdesc="An Electron-based Discord app with Vencord & improved Linux support using system provided electron. Unsupported"
pkgver=1.5.5
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

sha256sums=('1e85a8ddd76d19b61dd5b2758842e7f3484e19784816d015442a3c5647ff026e'
            'c91c8f389128d1cadf8a628a8a7a12d7b6c1bbee12f171ccf2ed84d287bb2afc'
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
