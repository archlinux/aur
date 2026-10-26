# Maintainer: executter <executter at hotmail dot com>

pkgname=ocsinventory-agent3
pkgver=3.0.0
pkgrel=1
pkgdesc="Hardware and software inventory agent for OCS Inventory server 3.x"
arch=('x86_64')
url="https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('dart')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'fix-agent-version.patch'
        'fix-os-release.patch'
        'fix-ip-address.patch')
sha256sums=('704d641fc523902f88c05aa665e68d614cf5a3a26ce1f69e5fd3610fc4725365'
            '212f04b36efccf976251226ce1fc09f333ce7dafe3b50634b5199f81bdf1a9d3'
            'd474fb83581dd17d282ea03558c9e3d9fc826e2d426e93e93ffd3179a4ad1b31'
            'b504d7ce0480966bb044d28703ec1df9ef3ac5e52afbd03c21a1cc248cba0923')

prepare() {
  cd OCSInventory-Agent-Rework-$pkgver

  # Merged after 3.0.0: https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework/pull/168
  patch -Np1 -i ../fix-agent-version.patch
  # https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework/pull/173
  patch -Np1 -i ../fix-os-release.patch
  # https://github.com/OCSInventory-NG/OCSInventory-Agent-Rework/pull/172
  patch -Np1 -i ../fix-ip-address.patch

  export PUB_CACHE="$srcdir/pub-cache"
  dart --suppress-analytics pub get
}

build() {
  cd OCSInventory-Agent-Rework-$pkgver

  export PUB_CACHE="$srcdir/pub-cache"
  dart --suppress-analytics compile exe -DAPP_VERSION=$pkgver \
    -o ocsinventory-cli lib/app/app.dart
}

package() {
  cd OCSInventory-Agent-Rework-$pkgver
  install -Dm755 ocsinventory-cli "$pkgdir/usr/bin/ocsinventory-cli"
}
