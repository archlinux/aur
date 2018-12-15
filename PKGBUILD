# Maintainer: wtzb <>

pkgname=mycrypto-bin
_pkgname=mycrypto
pkgver=1.5.0
pkgrel=1
pkgdesc='Open-source, client-side tool for generating Ether Wallets, handling ERC-20 tokens, and interacting with the blockchain more easily'
arch=('x86_64')
depends=('electron')
provides=('mycrypto')
conflicts=('mycrypto')
url='https://github.com/MyCryptoHQ/MyCrypto'
license=('MIT')
source=("${url}/releases/download/${pkgver}/linux-x86-64_${pkgver}_MyCrypto.AppImage"
        'LICENSE'
        'mycrypto.sh')
sha256sums=('55bddcdbb8849bcaab0f671e77a473577c5a9bafa5a6fe1add2aa1c0b558f105'
            'e4d52665623eaeb7d6efa43c0c29d225cd009cd766dc15f1b464a19cab1ec5cb'
            'eb800f7d523bbff35010f640d06cc35c7fd62ee522c9615cd45acb5413df01f0')

prepare() {
  # Extract AppImage
  chmod +x linux-x86-64_${pkgver}_MyCrypto.AppImage
  ./linux-x86-64_${pkgver}_MyCrypto.AppImage --appimage-extract &>/dev/null
  mv squashfs-root $_pkgname-$pkgver
}

package() {
  cd $_pkgname-$pkgver

  # Lib directory
  install -Dm644 app/resources/app.asar -t "$pkgdir"/usr/share/$_pkgname/
  # Executable
  install -Dm755 ../mycrypto.sh "$pkgdir"/usr/bin/$_pkgname
  # Desktop entry
  sed -i s/AppRun/$_pkgname/ mycrypto.desktop
  install -Dm644 mycrypto.desktop -t "$pkgdir"/usr/share/applications/
  # Icon
  install -Dm644 usr/share/icons/hicolor/0x0/apps/mycrypto.png \
    -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
  # License
  install -Dm644 "$srcdir"/LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname/
}
