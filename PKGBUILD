# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=wire-desktop
pkgver=3.37.3607
pkgrel=1
pkgdesc="End-to-end encrypted messenger with file sharing, voice calls and video conferences"
arch=(any)
url="https://wire.com/"
license=(GPL-3.0-or-later)
_electronver=33
depends=(
  "electron$_electronver"
  hicolor-icon-theme
  org.freedesktop.secrets
)
makedepends=(
  git
  libxcrypt-compat
  yarn
)
optdepends=('emoji-font: colorful emoji')
install=$pkgname.install
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/wireapp/wire-desktop/archive/linux/$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz.sig::https://github.com/wireapp/wire-desktop/releases/download/linux%2F$pkgver/$pkgver.tar.gz.sig"
  "$pkgname.desktop"
  "$pkgname.sh"
)
sha256sums=('8c272fb347d9238995df1afa6bdfc989fc2fb5a0362e7f7ade3dd065dd633e2b'
            'SKIP'
            '53f37e99d4c2f41a3e31fd70154d82ba06a4af578c68df86af4906f7f37ec787'
            'e443d426819fb647b7fb4a2db36e3f03589c990bd443a0d3d0ff05e5485ea39e')
validpgpkeys=('ABBA007D6E14E2DB5B283C45D599C1AA126762B1') # Wire Releases Signing Key <releases@wire.com>

prepare() {
  cd $pkgname-linux-$pkgver
  sed -i "s/@_electronver@/$_electronver/" "$srcdir/wire-desktop.sh"
  yarn install --immutable
}

build() {
  cd $pkgname-linux-$pkgver
  export BUILD_NUMBER="${pkgver##*.}"
  export LINUX_TARGET=pacman
  yarn build:linux
}

package() {
  cd $pkgname-linux-$pkgver
  install -vDm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -vDm644 -t "$pkgdir/usr/lib/$pkgname" wrap/dist/linux-unpacked/resources/app.asar

  install -vDm644 -t "$pkgdir/usr/share/applications" "$srcdir/$pkgname.desktop"
  install -vDm644 resources/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -vDm644 resources/icons/256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
