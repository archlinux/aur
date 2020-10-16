# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=responsively
pkgver=0.14.0
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
  '5042e7ba582e0394208df488cd0296379ff2a1298339b01ba808523d211d0b70ac24ed70f6734cb1606fe40736df1e8b8450ae08c709d5e12eea33502533552d'
  'eebe6acbb675d8804d87e34f6a005f55268ef8927e7bb1c7199791dfdbd4c3839ffe61ba2e59c23359dc9cbbfd74bed9d9610d0cd71e9961666b8167b3a04c33'
  '64b076bbe5cf876e372a7a35ebb35f16d4e754c7b5ba39e0598e090212fb7e81bb2aa93b403768be64de9a5dbec3d83ad70b3172fb7d7ebae92ceb7bf140a4f0'
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
