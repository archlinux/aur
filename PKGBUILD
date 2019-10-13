pkgname='generic-macro-deck'
pkgver=1.0.0
pkgrel=4
pkgdesc='Turn any keyboard into a macro board'
arch=('x86_64')
url='https://gitlab.com/ArisuOngaku/genericmacrodeck'
license=('MIT')
source=('git://github.com/ArisuOngaku/generic_macro_deck.git'
  'generic-macro-deck'
  'generic-macro-deck.desktop')
md5sums=('SKIP' 'dbe4291eb1d5d16004e0706552c05343' '80de93e925802dda57c32a60dcb9f45d')
provides=('generic-macro-deck')
conflicts=('generic-macro-deck')
depends=('electron' 'xorg-xinput')
makedepends=('yarn' 'npm')

prepare() {
  cd "$srcdir/generic_macro_deck" || exit 1
  yarn install
}

pkgver() {
  cd "$srcdir/generic_macro_deck" || exit 1
  npm ls $pkgname | head -n 1 | cut -d " " -f 1 | cut -d "@" -f 2
}

build() {
  cd "$srcdir/generic_macro_deck" || exit 1
  yarn build-arch
}

package() {
  install -Dm644 "$srcdir/generic_macro_deck/LICENSE" "$pkgdir/usr/share/licenses/generic_macro_deck/LICENSE"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/generic_macro_deck/resources/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -dr --no-preserve=ownership "$srcdir/generic_macro_deck/dist/linux-unpacked/." "$pkgdir/opt/$pkgname/"
}
