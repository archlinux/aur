# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=responsively
pkgver=1.8.0
pkgrel=1
pkgdesc='A modified browser built using Electron that helps in responsive web development'
url='https://github.com/responsively-org/responsively-app'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('zlib')
makedepends=('yarn')
options=('!strip')
_pkgver="${pkgver/\.beta/-beta}"

source=(
  "https://github.com/responsively-org/responsively-app/archive/v${_pkgver}.tar.gz"
  "$pkgname.desktop"
  'fix-build.patch'
)

sha512sums=(
  'd901a1b1867e64eb54eccad4e071702302872e271f709e2a1a72ebfcac661aef6b276e5c06cb40202809a3c8df0e3e211216faf153636eb0e8a2fa74cb42feb7'
  'eebe6acbb675d8804d87e34f6a005f55268ef8927e7bb1c7199791dfdbd4c3839ffe61ba2e59c23359dc9cbbfd74bed9d9610d0cd71e9961666b8167b3a04c33'
  'SKIP'
)

prepare() {
  cd $pkgname-app-$_pkgver
  patch -p1 < ../fix-build.patch
}

build() {
  cd $pkgname-app-$_pkgver/desktop-app
  yarn install
  yarn package
}

package() {
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd $pkgname-app-$_pkgver/desktop-app
  install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 release/build/ResponsivelyApp-${_pkgver}.AppImage "$pkgdir/usr/bin/$pkgname"
}
