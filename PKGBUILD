# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Sven Schulz <omee@archlinux.de>

pkgname=ssldump
pkgver=1.9
pkgrel=1
pkgdesc='SSLv3/TLS network protocol analyzer'
url=https://github.com/adulau/ssldump
license=(BSD)
arch=(x86_64)
depends=(json-c libnet libpcap openssl)
makedepends=(cmake ninja)
source=("$pkgname-$pkgver.tar.gz::https://github.com/adulau/ssldump/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c81ce58d79b6e6edb8d89822a85471ef51cfa7d63ad812df6f470b5d14ff6e48')

prepare() {
  sed -i 's|/usr/local|/usr|' $pkgname-$pkgver/CMakeLists.txt
}

build() {
  cmake -G Ninja -B $pkgname-$pkgver/build -S $pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  ninja -C $pkgname-$pkgver/build
  $pkgname-$pkgver/build/ssldump -v
}

package() {
  install -Dm644 $pkgname-$pkgver/COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  DESTDIR="$pkgdir" ninja -C $pkgname-$pkgver/build install
}
