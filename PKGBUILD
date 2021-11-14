# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>

pkgname='gitify'
_pkgname="Gitify"
pkgver=4.3.0
pkgrel=1
pkgdesc='GitHub notifications on your menu bar.'
arch=('x86_64')
url='https://www.gitify.io/'
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=('yarn')
install="Gitify.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/manosim/gitify/archive/v$pkgver.tar.gz")
sha512sums=('57461faa93c568956e20289cb37ced684f51d31f071d982c91b8c0f08b8ec770ff388954dd677319de2df4bb12f444c6f54eeec9bce8ea785b14803afd07c28b')

prepare() {
  cd "$pkgname-$pkgver"

  # Don't build the AppImage package
  sed -i '/"AppImage"/d' package.json

  yarn install
}

build() {
  cd "$pkgname-$pkgver"

  yarn build
  yarn make:linux --"${!CARCH}"
}

package() {
  cd "$pkgname-$pkgver"

  ar p "./dist/${pkgname}_${pkgver}_amd64.deb" data.tar.xz | tar xJ -C "$pkgdir"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
