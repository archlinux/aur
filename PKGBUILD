# Maintainer: Sum01 https://github.com/sum01
# Contributor: j1simon
pkgname=buttercup
pkgver=0.17.2
pkgrel=2
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup"
license=('GPL3')
depends=('gtk2' 'gconf' 'libxtst' 'alsa-lib' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("https://github.com/buttercup/buttercup/archive/v$pkgver.tar.gz"
"buttercup.desktop")
sha256sums=('0a4db0c51a25122a5e786b1f7de2ddd2e5c6aad63149938ecc797386d892c53c'
'1dd4ebbb268442e4c1a27ff720a1227b3aa01a11de939713602fb24c13890178')
prepare(){
  sed -i '/"rpm",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"AppImage",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i 's/"deb"/"zip"/' "$srcdir/$pkgname-$pkgver/package.json"
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
  install -m644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.svg"
  install -m644 "$srcdir/buttercup.desktop" "$pkgdir/usr/share/applications/"
  ln -s /usr/lib/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  if [[ $CARCH = "i686" ]]; then
    mv "$srcdir/$pkgname-$pkgver/release/linux-ia32-unpacked" "$pkgdir/usr/lib/$pkgname"
  else
    mv "$srcdir/$pkgname-$pkgver/release/linux-unpacked" "$pkgdir/usr/lib/$pkgname"
  fi
}
