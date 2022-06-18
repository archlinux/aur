# Maintainer: Alice Gaudon <alice at gaudon dot pro>

pkgname='tabs-app'
pkgver=1.3.2
pkgrel=1
pkgdesc='Persistent and separate browser tabs in one window'
arch=('x86_64')
url='https://eternae.ink/ashpie/tabs'
license=('GPL3')
source=("tabs-src::git+https://eternae.ink/ashpie/tabs.git#tag=v$pkgver"
  'tabs-app'
  'tabs-app.desktop')
sha512sums=('SKIP'
  '20d96d59a93ff83fff36bb2a1f8896763c0bae990983777c9e8b34086b37544f9aee31ba57791de82ebe23d7a9c182bdea47dba264636e8456af7e1aedb2665e'
  '94bf995f0e4a132bd41452ca75deaffe58b3cf434adacf7371ba74e14b32a6c116e7686abea0796081bc8af3dc0c10a1059a9afa651ef13da1b4751dced89644')
provides=('tabs-app')
conflicts=('tabs-app')
depends=('gtk3' 'nss')
makedepends=('git' 'yarn' 'npm')

prepare() {
  cd "$srcdir/tabs-src" || exit 1
  yarn install
}

build() {
  cd "$srcdir/tabs-src" || exit 1
  yarn compile && yarn electron-builder -l dir
}

package() {
  install -Dm644 "$srcdir/tabs-src/LICENSE" "$pkgdir/usr/share/licenses/tabs-app/LICENSE"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/tabs-src/resources/images/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -dr --no-preserve=ownership "$srcdir/tabs-src/dist/linux-unpacked/." "$pkgdir/opt/$pkgname/"
  install -Dm644 "$srcdir/tabs-src/dev-app-update.yml" "$pkgdir/opt/$pkgname/resources/app-update.yml"
}
