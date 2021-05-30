# Maintainer: naetherm <naether.markus@gmail.com>
# Maintainer: Adrien Jussak <adrien.jussak@wascardev.com>
# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
_pkgexename=buttercup
pkgver=2.6.0
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('i686' 'x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss' 'libsass')
makedepends=('npm' 'sed' 'nodejs-lts-fermium')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
	badge.svg
	buttercup-desktop.desktop)
sha512sums=(
	'fdf458c7b703e0ec0569e76d2c90a7620df219094caf88aeaba7ab487dfca2f60a4b6b585a10746ca5e821a7f62989a9a92d11d465e0178e0bc5b79e16ea7509'
	SKIP
	SKIP)
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
  cp "$srcdir"/badge.svg "$srcdir/$pkgname-$pkgver/build/badge.svg"
  cp "$srcdir"/buttercup-desktop.desktop "$srcdir/$pkgname-$pkgver/build/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/badge.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.svg"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  if [[ $CARCH == "i686" ]]; then
    _distname="linux-ia32-unpacked"
  else
    _distname="linux-unpacked"
  fi
  mkdir -p "$pkgdir"/{usr/bin,share}
  cp -rf "$srcdir/$pkgname-$pkgver/dist/$_distname" "$pkgdir/usr/share/$pkgname"
  # cp -rf "$srcdir/$pkgname-$pkgver/dev-app-update.yml" "$pkgdir/opt/$pkgname/resources/app-update.yml"
  ln -sf /usr/share/$pkgname/buttercup "$pkgdir/usr/bin/buttercup"
}
