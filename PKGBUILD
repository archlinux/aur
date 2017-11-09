# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=0.22.2
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk2' 'gconf' 'libxtst' 'alsa-lib' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
"buttercup-desktop.desktop")
sha512sums=('adf2ea2cd7ca063869f5672412a73b3a9a8a35dd28420be9b0fad29a5c9af21a017655d8c67c10e32f378eb4ca7cbcd1f890c98d80c85491af434ceb5f3f4c4d'
            'c358199263d908304b2fd55b69bfc7c0671a5287f2d0f978dbd7da89f350052fcd28ce16a32074adaee358e486763c0d4a0519734c2fd49debf5fc866a513ad3')
prepare(){
  sed -i '/"rpm",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"AppImage",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i 's/"deb"/"dir"/' "$srcdir/$pkgname-$pkgver/package.json"
  if [[ "$CARCH" == "i686" ]]; then
    sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-$pkgver/package.json"
  fi
}
build(){
  cd "$srcdir/$pkgname-$pkgver"
  npm install --cache "$srcdir/npm-cache"
  npm run build
  npm run package:linux
}
check() {
  cd "$srcdir/$pkgname-$pkgver"
  npm test
}
package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  if [[ "$CARCH" == "i686" ]]; then
    _distname="linux-ia32-unpacked"
  else
    _distname="linux-unpacked"
  fi
  mkdir -p "$pkgdir"/usr/{lib,bin}
  mv "$srcdir/$pkgname-$pkgver/release/$_distname" "$pkgdir/usr/lib/$pkgname"
  ln -s /usr/lib/$pkgname/$pkgname "$pkgdir/usr/bin/buttercup"
}
