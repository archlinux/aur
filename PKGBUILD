# Maintainer: edu4rdshl <edu4rdshl@protonmail.com>
_pkgname=Vesktop
pkgname=vesktop
pkgdesc="A standalone Electron-based Discord app with Vencord & improved Linux support"
pkgver=1.6.7
pkgrel=1

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-only')

depends=('alsa-lib' 'gtk3' 'nss')
makedepends=('pnpm' 'npm' 'nodejs')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/Vencord/Vesktop/archive/v${pkgver}.tar.gz" "vesktop.desktop" "vesktop.sh")

sha256sums=('8c0dbd65e85f46797bc89591a92f8677e2565ea51cd96f661f1dd5da74c819d1'
            '98fa8f661b065c2d825e24f0055a40ae01d58d23628ad7ebf6914296209dd43c'
            '506c246328af639d6f6a3e52215c7b34af2a6df11d195de6f57a8bbee750cce9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  pnpm i --frozen-lockfile
  pnpm package:dir
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Create necessary directories
  install -d "$pkgdir/usr/lib/$pkgname"
  install -d "$pkgdir/usr/bin"

  # change folder to copy per arch
  case "${CARCH}" in
    "aarch64") folder="linux-arm64-unpacked" ;;
    *) folder="linux-unpacked" ;;
  esac


  cp -R "dist/${folder}/." "$pkgdir/usr/lib/$pkgname"

  install -Dm644 "../vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop" # Install desktop entry
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" # Install license
  install -Dm644 "build/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg" # Install icons

  install -Dm755 "../vesktop.sh" "$pkgdir/usr/bin/$pkgname" # Start script
}
