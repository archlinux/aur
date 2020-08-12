# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=responsively
pkgver=0.10.0
pkgrel=1
pkgdesc='A modified browser built using Electron that helps in responsive web development'
url='https://github.com/responsively-org/responsively-app'
license=('AGPL3')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
depends=('zlib')
makedepends=('yarn')
options=('!strip')

source=(
  "https://github.com/responsively-org/responsively-app/archive/v$pkgver.tar.gz"
  "$pkgname.desktop"
  'no-rpm-build.patch'
)

sha512sums=(
  '187d268df40fe16c687a2c218684ac5726bf651acb9fe93ce684ee88e2868a05c883e93e30c8a215d91ba4457a8e2d9874f38af6120e730d0522b9da6c5f602c'
  'eebe6acbb675d8804d87e34f6a005f55268ef8927e7bb1c7199791dfdbd4c3839ffe61ba2e59c23359dc9cbbfd74bed9d9610d0cd71e9961666b8167b3a04c33'
  '9644cb5d39cd3b1e6a863606280d67dfd6a31c91876e5a50687927b03fbc948b8f52eea12bc949761d7b3e59c02ad941c2f39482aae4d6c1780f07cca7f69580'
)

prepare() {
  cd $pkgname-app-$pkgver
  patch -p1 < ../no-rpm-build.patch
}

build() {
  cd $pkgname-app-$pkgver/desktop-app
  yarn install
  yarn package-linux
}

package() {
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd $pkgname-app-$pkgver/desktop-app
  install -Dm644 resources/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 release/ResponsivelyApp-${pkgver}.AppImage "$pkgdir/usr/bin/$pkgname"
}
