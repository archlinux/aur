# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=0.21.0
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk2' 'gconf' 'libxtst' 'alsa-lib' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
"buttercup-desktop.desktop")
sha512sums=('33c16a5476a0417f5174ea43044628146f8e27bbc06b167bd4b17b25a5a976c2ccb016b3641bcee4fb0184c238e93641930ea6e9e6d30ef2274364f1f54c7a43'
            '4113fd636c3e1cd596d1805555951dbcd0b05971af2968a5617268b3c1f84be46581a02c89a6edffe37eb1ff7b8ea3fd086f8f0327c25b8fce53fa978fe762a0')
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
    npm install --cache "$srcdir/npm-cache"
    npm run build
    npm run package:linux
}
package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  if [[ $CARCH = "i686" ]]; then
    _distname="linux-ia32-unpacked"
  else
    _distname="linux-unpacked"
  fi
  mkdir -p "$pkgdir/usr/share"
  mv "$srcdir/$pkgname-$pkgver/release/$_distname" "$pkgdir/usr/share/$pkgname"
}
