# Maintainer: PolpOnline <aur at t0mmy dot anonaddy dot com>

pkgname='gitify'
_pkgname="Gitify"
pkgver=4.2.1
pkgrel=1
pkgdesc='GitHub notifications on your menu bar.'
arch=('x86_64')
url='https://www.gitify.io/'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
makedepends=('nodejs>=12.0.0' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/manosim/gitify/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f570267aad17dfb43a405d3b7d5b799f388fbdf37ac1339fe62c6cef303e8de7a3bbb7c38ce688ab4ce46eca17150454a6324d09ee458622cd781d2f50f77530')

prepare() {
  cd "$pkgname-$pkgver"

  # Working around this issue: https://github.com/manosim/gitify/issues/503
  sed -i 's/"version": "4.2.0",/"version": "4.2.1",/g' package.json
}

build() {
  cd "$pkgname-$pkgver"

  yarn install
  yarn build
  yarn make:linux
}

package() {
  cd "$pkgname-$pkgver"

  ar p "./dist/${pkgname}_${pkgver}_amd64.deb" data.tar.xz | tar xJ -C "$pkgdir"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgname/gitify" "$pkgdir/usr/bin/gitify"
}
