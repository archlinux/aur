# Maintainer: wtzb <>

pkgname=mycrypto-bin
_pkgname=mycrypto
pkgver=1.5.6
pkgrel=2
pkgdesc='Open-source, client-side tool for generating Ether Wallets, handling ERC-20 tokens, and interacting with the blockchain more easily'
arch=('x86_64')
provides=('mycrypto')
conflicts=('mycrypto')
url='https://github.com/MyCryptoHQ/MyCrypto'
license=('MIT')
source=("${url}/releases/download/${pkgver}/linux-x86-64_${pkgver}_MyCrypto.AppImage"
        'LICENSE')
sha256sums=('b07ab5535da05c42d251c62225115459a0ab5e1e2e6cc3003a6efbb56e5f4214'
            '1b0a4ebe6200441fe008bba2b60bb227b944cd77427b3f9c60f6f7e32120a65d')

prepare() {
  # Extract AppImage
  chmod +x linux-x86-64_${pkgver}_MyCrypto.AppImage
  ./linux-x86-64_${pkgver}_MyCrypto.AppImage --appimage-extract &>/dev/null
  mv squashfs-root $_pkgname-$pkgver
}

package() {
  cd $_pkgname-$pkgver

  # Executable
  mkdir -p "$pkgdir"/usr/share/$_pkgname
  mkdir -p "$pkgdir"/usr/bin
  mv ./app/* "$pkgdir"/usr/share/$_pkgname
  chmod 755 "$pkgdir"/usr/share/$_pkgname
  ln -s "$pkgdir"/usr/share/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  # Desktop entry
  sed -i s/AppRun/$_pkgname/ mycrypto.desktop
  install -Dm644 mycrypto.desktop -t "$pkgdir"/usr/share/applications/
  # Icon
  install -Dm644 usr/share/icons/hicolor/0x0/apps/mycrypto.png \
    -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
  # License
  install -Dm644 "$srcdir"/LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname/
}

