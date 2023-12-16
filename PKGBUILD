# Maintainer: naetherm <naether.markus@gmail.com>
# Maintainer: Adrien Jussak <adrien.jussak@wascardev.com>
# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
_pkgexename=buttercup
pkgver=2.24.4
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss' 'libsass')
makedepends=('npm' 'sed' 'nodejs')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
	badge.svg
	buttercup-desktop.desktop
	arch_fix.patch)
sha512sums=('a88ccedf3cf63452f8b0b9d0ab9b5494b38a9cf458c3a55e961d05d8827d9cbbff901032d933d176d75575fb4baa5bd77e58a529e82cf8f7a21d05044eeebaa8'
            '999131f7dde17c460a0cea9a3d1900a13178c096fb618c6ba5f34a83045b7447b4571571c771bc5988e4867107638c653f7babc84011705352d763e9130424db'
            'bc6af99782518980ea7fb8ed41d4e5a9998d01ac6ea1467cf6d232af987cf5aa5d71674720d0f4f71fa7f48d3a6270148b2297fc91e78bfa2fae4c11f16a5083'
            'a86c0069e0c42032597b27f5c0e218f8430ff21bdc37d54834ce3c227942581bb09859301f743c6a1c98e0ba2348c749e80160350629f1d9981fbe4a31416beb')
prepare() {
  sed -i '/"rpm",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"AppImage",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i '/"snap",/d' "$srcdir/$pkgname-$pkgver/package.json"
  sed -i 's/"deb"/"dir"/' "$srcdir/$pkgname-$pkgver/package.json"
  if [[ $CARCH == "i686" ]]; then
    sed -i 's/build --linux --x64/build --linux --ia32/' "$srcdir/$pkgname-$pkgver/package.json"
  fi
  patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/arch_fix.patch"
}
build() {
  export NODE_ARCHITECTURE=x64
  cd "$srcdir/$pkgname-$pkgver"
  npm install keytar
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
  mkdir -p "$pkgdir"/usr/{bin,share}
  cp -rf "$srcdir/$pkgname-$pkgver/dist/$_distname" "$pkgdir/usr/share/$pkgname"
  # cp -rf "$srcdir/$pkgname-$pkgver/dev-app-update.yml" "$pkgdir/opt/$pkgname/resources/app-update.yml"
  ln -sf /usr/share/$pkgname/buttercup "$pkgdir/usr/bin/buttercup"
}
