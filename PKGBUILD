# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=responsively
pkgver=0.16.0
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
  'fix-build.patch'
)

sha512sums=(
  '54bb68421fec70d41ccd32138054d9b1638af885e65eb4365086d47a92c3229281fa5f10325138887c6b862a8a73ed867b42115ce25002b9db001884f39845ce'
  'eebe6acbb675d8804d87e34f6a005f55268ef8927e7bb1c7199791dfdbd4c3839ffe61ba2e59c23359dc9cbbfd74bed9d9610d0cd71e9961666b8167b3a04c33'
  '090bd2ec98d804aa01dfa11f2f64e22d119498e1eed8a03d6235906a5afcd55b775839ba8412a9c813b284cf6be38c35bf156b1b3f4da82255095e4ebe41e90c'
)

prepare() {
  cd $pkgname-app-$pkgver
  patch -p1 < ../fix-build.patch
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
