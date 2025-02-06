# Maintainer: zt <zt@zt64.dev>
# Maintainer: cookie <kyliepc@proton.me>
_pkgname=vesktop
pkgname=vesktop-electron-git
pkgdesc="An Electron-based Discord app with Vencord & improved Linux support using system provided Electron. Unsupported"
pkgver=1.5.5.r1.gd75ab4a
pkgrel=1

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')

depends=('electron')
makedepends=('git' 'nodejs>=18')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vesktop")
conflicts=('vesktop')

source=("$_pkgname::git+$url.git" "vesktop.desktop" "vesktop.sh" "afterPack.js")

sha256sums=('SKIP'
            'c91c8f389128d1cadf8a628a8a7a12d7b6c1bbee12f171ccf2ed84d287bb2afc'
            '58c61ef14e5eaefe7207a6b66b065973a6002a2ae1d0fb9fd8ec2d2c2b198607'
            '122b17ce996318e533e6f2ab1c9b2961b39c3eba271c9b40f10c0da5dd738baa')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  # Add unpacked icon extraction script
  sed -i '/"beforePack": "scripts\/build\/sandboxFix.js",/a\ \ \ \ \ \ \ \ "afterPack": "'$srcdir'/afterPack.js",' package.json
  # Use corepack pnpm for postinstall
  sed -i '/"postinstall": "pnpm updateArrpcDB",/a\ \ \ \ \ \ \ \ "postinstall": "corepack pnpm updateArrpcDB"' package.json

  # Use system's electron
  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/electron\",\n/" package.json

  corepack pnpm i
  corepack pnpm build
  corepack pnpx electron-builder --dir
}

package() {
  cd "$srcdir/$_pkgname"

  # Create necessary directories
  install -d "$pkgdir/usr/lib/$_pkgname"
  install -d "$pkgdir/usr/bin"

  cp "dist/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$_pkgname"

  install -Dm644 "../vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop" # Install desktop entry
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Install license
  for _icons in 1024 512 256 128 64 48 32 16; do
    install -Dm644 "dist/.icon-set/icon_${_icons}.png" "$pkgdir/usr/share/icons/hicolor/${_icons}x${_icons}/apps/$_pkgname.png"
  done # Install icons

  install -Dm755 "../vesktop.sh" "$pkgdir/usr/bin/$_pkgname" # Start script
}
