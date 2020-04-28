pkgname='tabs-app'
pkgver=0.6.4
pkgrel=0
pkgdesc='Persistent and separate browser tabs in one window'
arch=('x86_64')
url='https://gitlab.com/ArisuOngaku/tabs'
license=('MIT')
source=('tabs-src::git://github.com/ArisuOngaku/tabs.git'
  'tabs-app'
  'tabs-app.desktop')
md5sums=('SKIP'
  '9f917d26f867332a9918174dbb3da24b'
  'd79af96f0aae124b670905215918b20a')
provides=('tabs-app')
conflicts=('tabs-app')
depends=('electron' 'xorg-xinput')
makedepends=('yarn' 'npm')

prepare() {
  cd "$srcdir/tabs-src" || exit 1
  yarn install
}

pkgver() {
  cd "$srcdir/tabs-src" || exit 1
  npm ls $pkgname | head -n 1 | cut -d " " -f 1 | cut -d "@" -f 2
}

build() {
  cd "$srcdir/tabs-src" || exit 1
  yarn build-arch
}

package() {
  install -Dm644 "$srcdir/tabs-src/LICENSE" "$pkgdir/usr/share/licenses/tabs-app/LICENSE"

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/tabs-src/resources/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  mkdir -p "$pkgdir/opt/$pkgname"
  cp -dr --no-preserve=ownership "$srcdir/tabs-src/dist/linux-unpacked/." "$pkgdir/opt/$pkgname/"
}
