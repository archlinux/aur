# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=0.18.0
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk2' 'gconf' 'libxtst' 'alsa-lib' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
"buttercup-desktop.desktop")
sha256sums=('03b58885c3decb622109a45d20d52ef9f69ead0605455d4dea3778f51619a4cb'
'891e1a3bb0c0ba5da55db050a00dcd47a3b651e1f857b7f79fa9c343ca3ca535')
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
