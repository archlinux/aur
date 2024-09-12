# Maintainer: Enrique AM <enriqueam.dev@gmail.com>
# Maintainer: naetherm <naether.markus@gmail.com>
# Maintainer: Adrien Jussak <adrien.jussak@wascardev.com>
# Maintainer: sum01 <sum01@protonmail.com>
# Contributor: j1simon
pkgname=buttercup-desktop
_pkgexename=buttercup
pkgver=2.28.1
pkgrel=1
pkgdesc='Javascript Password Vault - Multi-Platform Desktop Application'
arch=('x86_64')
url="https://github.com/buttercup/buttercup-desktop"
license=('GPL3')
depends=('gtk3' 'libxss' 'nss' 'libsass')
makedepends=('npm' 'sed' 'nodejs')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/buttercup/buttercup-desktop/archive/v$pkgver.tar.gz"
	buttercup-desktop.desktop
	arch_fix.patch)
sha512sums=('eaa39d1158fd50043c4ac9fbb80ff3e27da16e26d33bec2df7d9e7f6ce7c74a8cac34d7f764ef884ad5cf23ce75f1a8fe5cc36d21830e06190c8b2a92cfa9774'
            'a6a0a6fa84705e22ac5e92b4cbdbbd2a8e822ad95bd897a8cad3a4633381ed4ca798a42b18a9a73db60ed3182d15a754bd8dda17e6f5db3541101df47173b51d'
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
  cp "$srcdir"/buttercup-desktop.desktop "$srcdir/$pkgname-$pkgver/build/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver/resources/build/icon.png" "$pkgdir/usr/share/icons/hicolor/scalable/apps/buttercup.png"
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
