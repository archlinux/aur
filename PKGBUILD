# Maintainer: zt <zt@zt64.dev>
# Maintainer: cookie <kyliepc@proton.me>
_pkgname=Vesktop
name=vesktop
pkgname=vesktop-electron
pkgdesc="An Electron-based Discord app with Vencord & improved Linux support using system provided electron. Unsupported"
pkgver=1.6.0
pkgrel=5

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')

depends=('electron')
makedepends=('pnpm' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vesktop")
conflicts=('vesktop')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/Vencord/Vesktop/archive/v${pkgver}.tar.gz" "vesktop.desktop" "vesktop.sh")

sha256sums=('679ea8afaac6fa99d19bc64e0209fb10c0ec70c6b5f887fadd07ca56ec643787'
            '455c00b862aa0a7e18ca8e23d65d5c5ee4506cdfb15f1bf6f622cce39827de46'
            'a2da313031cfaa892f0f2e51fd0ffafbc14001d4efb0523bb8bfaeb7f4ddc3fa')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Use system's electron
  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/electron\",\n/" package.json

  pnpm i --frozen-lockfile
  pnpm package:dir
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Create necessary directories
  install -d "$pkgdir/usr/lib/$name"
  install -d "$pkgdir/usr/bin"

  cp dist/linux-*unpacked/resources/app.asar "$pkgdir/usr/lib/$name"

  install -Dm644 "../vesktop.desktop" "$pkgdir/usr/share/applications/$name.desktop" # Install desktop entry
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Install license
  install -Dm644 "build/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$name.svg" # Install icons

  install -Dm755 "../vesktop.sh" "$pkgdir/usr/bin/$name" # Start script
}
