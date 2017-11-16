# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
pkgver=0.24.1
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk2' 'gconf' 'libxtst' 'alsa-lib' 'libxss' 'nss')
makedepends=('npm' 'sed')
source=("https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
  "buttercup-desktop.desktop")
sha512sums=('e660ea3e217c96607809e3650be7ef82724cd92f06717a3fae3aed9c6fa690061bc7db13478fdb6b56ed0097c073ac8f6bdea08b758acac4731a6c67f460f60e'
            'c358199263d908304b2fd55b69bfc7c0671a5287f2d0f978dbd7da89f350052fcd28ce16a32074adaee358e486763c0d4a0519734c2fd49debf5fc866a513ad3')
prepare() {
  sed -i '/"rpm",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"AppImage",/d' "$srcdir/$pkgname-$pkgver/package.json"
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
check() {
  cd "$srcdir/$pkgname-$pkgver"
  npm test
}
package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  if [[ $CARCH == "i686" ]]; then
    _distname="linux-ia32-unpacked"
  else
    _distname="linux-unpacked"
  fi
  mkdir -p "$pkgdir"/usr/{lib,bin}
  mv "$srcdir/$pkgname-$pkgver/release/$_distname" "$pkgdir/usr/lib/$pkgname"
  ln -s /usr/lib/$pkgname/$pkgname "$pkgdir/usr/bin/buttercup"
}
