# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>

pkgname='gitify'
_pkgname="Gitify"
pkgver=4.3.1
pkgrel=1
pkgdesc='GitHub notifications on your menu bar.'
arch=('x86_64')
url='https://www.gitify.io/'
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
makedepends=('yarn')
install="Gitify.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/manosim/gitify/archive/v$pkgver.tar.gz")
sha512sums=('5616a423eb14998762dd6db9293c0c5a25cf61a0a20ea5ccadab9d4c62723ff42ece8540d50b1fbcccc5abd1561da2d1f67cdf7ef1c59a95b149db3c76a3a011')

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
