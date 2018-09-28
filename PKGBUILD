# Maintainer: xsmile <>

pkgname=mycrypto-bin
_pkgname=mycrypto
pkgver=1.3.1
pkgrel=1
pkgdesc='Open-source, client-side tool for generating Ether Wallets, handling ERC-20 tokens, and interacting with the blockchain more easily'
arch=('x86_64')
depends=('gconf' 'gtk3' 'libxss' 'nss')
provides=('mycrypto')
conflicts=('mycrypto')
url='https://github.com/MyCryptoHQ/MyCrypto'
license=('MIT')
source=("${url}/releases/download/${pkgver}/linux-x86-64_${pkgver}_MyCrypto.AppImage"
        'LICENSE')
sha256sums=('2fae8e16b02f2f24e22fe47a09b19ae7240fadf5cf95d31a59554be7218adb11'
            'e4d52665623eaeb7d6efa43c0c29d225cd009cd766dc15f1b464a19cab1ec5cb')

prepare() {
  # Extract AppImage
  chmod +x linux-x86-64_${pkgver}_MyCrypto.AppImage
  ./linux-x86-64_${pkgver}_MyCrypto.AppImage --appimage-extract &>/dev/null
  mv squashfs-root $_pkgname-$pkgver
}

package() {
  cd $_pkgname-$pkgver

  # Lib directory
  install -d "$pkgdir"/usr/lib/$_pkgname
  cp -r app/{locales,resources,*.dat,*.pak,*.so,*.bin} "$pkgdir"/usr/lib/$_pkgname
  install -Dm755 app/mycrypto -t "$pkgdir"/usr/lib/$_pkgname
  # Desktop entry
  sed -i s/AppRun/mycrypto/ mycrypto.desktop
  install -Dm644 mycrypto.desktop -t "$pkgdir"/usr/share/applications
  # Icon
  install -Dm644 usr/share/icons/hicolor/0x0/apps/mycrypto.png \
    -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  # Executable
  install -d "$pkgdir"/usr/bin
  ln -s /usr/lib/$_pkgname/mycrypto "$pkgdir"/usr/bin/$_pkgname
  # Licenses
  install -Dm644 "$srcdir"/LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
  cp -r app/{*.txt,*.html} "$pkgdir"/usr/share/licenses/$_pkgname
  # Fix permissions
  find "$pkgdir"/usr -type d -exec chmod 755 {} \;
}
