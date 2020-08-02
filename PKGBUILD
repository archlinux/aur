# Maintainer: naetherm <naether.markus@gmail.com>
# Maintainer: Adrien Jussak <adrien.jussak@wascardev.com>
# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=1.20.4
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("$pkgname-$pkgver.tar.gz::https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz")
sha512sums=('01027430530bfe22bfca49d4ab0f132289792757ae76eaefdbbbe755b02e4b066547db14a0bfd728cef069c2e7b376da2345f79fd3be12c9edb2dc04564ca5be')
prepare() {
  sed -i '/"rpm",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"AppImage",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"snap",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i 's/"deb"/"dir"/' "$srcdir/$pkgname-$pkgver/package.json"
  if [[ $CARCH == "i686" ]]; then
    sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-$pkgver/package.json"
  fi
}
build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install --cache "$srcdir/npm-cache"
  npm run build
  npm run package:linux
}
package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.svg"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  if [[ $CARCH == "i686" ]]; then
    _distname="linux-ia32-unpacked"
  else
    _distname="linux-unpacked"
  fi
  mkdir -p "$pkgdir"/{usr/bin,opt}
  cp -rf "$srcdir/$pkgname-$pkgver/release/$_distname" "$pkgdir/opt/$pkgname"
  cp -rf "$srcdir/$pkgname-$pkgver/dev-app-update.yml" "$pkgdir/opt/$pkgname/resources/app-update.yml"
  ln -sf /opt/$pkgname/$pkgname "$pkgdir/usr/bin/buttercup"
}
