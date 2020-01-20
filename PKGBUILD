# Maintainer: wtzb <>

pkgname=mycrypto-bin
pkgbin=mycrypto
pkgver=1.7.4
pkgrel=1
pkgdesc='Open-source, client-side tool for generating Ether Wallets, handling ERC-20 tokens, and interacting with the blockchain more easily'
package="linux-x86-64_${pkgver}_MyCrypto.AppImage"
arch=('x86_64')
provides=('mycrypto')
conflicts=('mycrypto')
url='https://github.com/MyCryptoHQ/MyCrypto'
license=('MIT')
source=("${url}/releases/download/${pkgver}/${package}"
        'LICENSE')
sha256sums=('31416af52f0b05d943a28c14290f0af1ef8c7625842a592f4a715c012ab192b3'
            '1b0a4ebe6200441fe008bba2b60bb227b944cd77427b3f9c60f6f7e32120a65d')

package() {
  # Extract files
  chmod +x "$srcdir/$package"
  `$srcdir/$package --appimage-extract &>/dev/null`
  # Clean old build dir files
  rm -rf $srcdir/$pkgbin
  mv -f "$srcdir/squashfs-root" "$srcdir/$pkgbin"

  # Install Icon
  install -Dm644 "$srcdir/$pkgbin/usr/share/icons/hicolor/0x0/apps/$pkgbin.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"

  install -d "$pkgdir/opt/$pkgbin"
  cp -a "$srcdir/$pkgbin/." "$pkgdir/opt/$pkgbin/"
  chmod -R +rx "$pkgdir/opt/$pkgbin"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgbin/app/$pkgbin" "$pkgdir/usr/bin/$pkgbin"
  # Provided .desktop file tries to run "AppRun" instead of mycrypto
  sed -e "s/AppRun/$pkgbin/g" -i $srcdir/$pkgbin/$pkgbin.desktop
  install -Dm644 "$srcdir/$pkgbin/$pkgbin.desktop" "$pkgdir/usr/share/applications/$pkgbin.desktop"
}

