# Maintainer: zt <zt@zt64.dev>
# Maintainer: cookie <kyliepc@proton.me>
_pkgname=vesktop
pkgname=vesktop-electron-git
pkgdesc="An Electron-based Discord app with Vencord & improved Linux support using system provided Electron (git version). Unsupported"
pkgver=r363.24fbf35
pkgrel=2

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
conflicts=('vesktop-git')

source=("$_pkgname::git+$url.git" "vesktop.desktop" "vesktop.sh" "afterPack.js")

sha256sums=('SKIP'
            'c7845033716d7fdec2ea1daf8c3575b504bc6a5c19c702e3722a0e6237ae571f'
            '7ae443361ea97f8ab287bdf60e2dc1fa1f5fea25eb16b95a3745fed51a111c33'
            '122b17ce996318e533e6f2ab1c9b2961b39c3eba271c9b40f10c0da5dd738baa')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  # Add unpacked icon extraction script
  sed -i '/"beforePack": "scripts\/build\/sandboxFix.js",/a\ \ \ \ \ \ \ \ "afterPack": "'$srcdir'/afterPack.js",' package.json

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

  install -Dm 644 "../vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop" # Install desktop entry
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Install license
  for _icons in 1024 512 256 128 64 48 32 16; do
    install -Dm644 "dist/.icon-set/icon_${_icons}.png" "$pkgdir/usr/share/icons/hicolor/${_icons}x${_icons}/apps/$_pkgname.png"
  done # Install icons

  install -Dm755 "../vesktop.sh" "$pkgdir/usr/bin/$_pkgname" # Start script
}
