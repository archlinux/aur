# Contributor: zt <zt@zt64.dev>
# Contributor: cookie <kyliepc@proton.me>
_pkgname=Vesktop
name=vesktop
pkgname=vesktop-electron
pkgdesc="An Electron-based Discord app with Vencord & improved Linux support using system provided electron. Unsupported"
pkgver=1.6.7
pkgrel=1

_electron=electron43

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')

depends=("${_electron}")
makedepends=('pnpm' 'npm')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("vesktop")
conflicts=('vesktop')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/Vencord/Vesktop/archive/v${pkgver}.tar.gz" "vesktop.desktop" "vesktop.sh")

sha256sums=('8c0dbd65e85f46797bc89591a92f8677e2565ea51cd96f661f1dd5da74c819d1'
            '455c00b862aa0a7e18ca8e23d65d5c5ee4506cdfb15f1bf6f622cce39827de46'
            '6fff721118efbe5a33e8ece228683a712ea06979dbdecf2a4ef7db2357a1e4d9')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Use system's electron
  sed -i "/linux/s/^/        \"electronDist\": \"\\/usr\\/lib\\/${_electron}\",\n/" package.json

  pnpm i --frozen-lockfile
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  pnpm buildLibVesktop
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
