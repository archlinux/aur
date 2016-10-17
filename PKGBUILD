# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Saleem Rashid <spudowiar@outlook.com>

pkgname=trezord
pkgrel=1
pkgver=1.2.0
_commit=ed755120af13a58ae339fc02c911573a71bee87d
pkgdesc='TREZOR Communication Daemon'
arch=('i686' 'x86_64')
url='http://bitcointrezor.com/'
license=('LGPL3')
depends=('boost-libs' 'protobuf' 'libmicrohttpd' 'jsoncpp' 'libusb')
makedepends=('git' 'cmake' 'boost')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/trezor/$pkgname/archive/v$pkgver.tar.gz
        $pkgname.sysusers
        git+https://github.com/trezor/trezor-crypto.git#commit=$_commit)
sha256sums=('883c68e5794b308a139706fea4549c9f8a7573d7e17d82f0fd3e7c0c8c36b6e7'
            'a4106f04d8322836905c6d300c0fb54849063bbc258ef76e28acdbec7c1c4df4'
            'SKIP')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver/vendor

  git clone "${srcdir}"/trezor-crypto

# disable static linking
  cd "${srcdir}"/$pkgname-$pkgver
  sed -i '/if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")/,/endif(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Darwin")/d' CMakeLists.txt
  sed -i 's/NAMES json$/&cpp/' cmake/modules/Findjsoncpp.cmake

  install -d build
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver/build

  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver/build

  install -Dm0755 $pkgname "${pkgdir}"/usr/bin/trezord
  install -Dm0644 "${srcdir}"/$pkgname.sysusers "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
  install -Dm0644 "${srcdir}"/$pkgname-$pkgver/release/linux/trezor.rules \
    "${pkgdir}"/usr/lib/udev/rules.d/51-trezor.rules
  install -Dm0644 "${srcdir}"/$pkgname-$pkgver/release/linux/$pkgname.service \
    "${pkgdir}"/usr/lib/systemd/system/$pkgname.service
}
