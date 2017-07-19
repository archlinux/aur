# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=0.18.2
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk2' 'gconf' 'libxtst' 'alsa-lib' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
"buttercup-desktop.desktop")
sha512sums=('e41c81a297f7f4d26cef57f30e4107ba123aebeb09cd9256d6eb5ae98d38d10ca55267c80d12f80c835173872907360149530840128977ea720db2783b65aefa'
            '29ffc70d18e05639a67f03d79023ce899f82b7ad04ea239518b7b1809c147ecbe86ecc8f72551828b4df35781e2c0803440e688d751ef2e0e8c537112d7d70b9')
prepare(){
  sed -i '/"rpm",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"AppImage",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i 's/"deb"/"dir"/' "$srcdir/$pkgname-$pkgver/package.json"
  if [[ $CARCH = "i686" ]]; then
    sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-$pkgver/package.json"
  fi
}
build(){
    cd "$srcdir/$pkgname-$pkgver/"
    npm install && npm run build && npm run package:linux
}
package() {
  mkdir -p "$pkgdir"/usr/{lib,bin,share/{applications,icons/hicolor/scalable/apps}}/
  install -m644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup-desktop.svg"
  install -m644 "$srcdir/buttercup-desktop.desktop" "$pkgdir/usr/share/applications/"
  ln -s /usr/lib/$pkgname/buttercup "$pkgdir/usr/bin/$pkgname"
  if [[ $CARCH = "i686" ]]; then
    mv "$srcdir/$pkgname-$pkgver/release/linux-ia32-unpacked" "$pkgdir/usr/lib/$pkgname"
  else
    mv "$srcdir/$pkgname-$pkgver/release/linux-unpacked" "$pkgdir/usr/lib/$pkgname"
  fi
}
