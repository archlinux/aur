# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Saleem Rashid <spudowiar@outlook.com>

pkgname=trezord
pkgrel=2
pkgver=1.2.0
_commitcrypto=3d364aac3618ca7cca1e7687a7a3d99f7981ccd6
_commitcommon='f50db0e6640b4a0ee1734b27e12304c318578c33'
pkgdesc='TREZOR Communication Daemon'
arch=('i686' 'x86_64')
url='https://github.com/trezor'
license=('LGPL3')
depends=('boost-libs' 'protobuf' 'libmicrohttpd' 'jsoncpp' 'libusb')
makedepends=('git' 'cmake' 'boost')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/trezor/$pkgname/archive/v$pkgver.tar.gz
        git+https://github.com/trezor/trezor-crypto.git#commit=$_commitcrypto
        git+https://github.com/trezor/trezor-common.git#commit=$_commitcommon
        $pkgname.sysusers
        $pkgname.patch)
sha256sums=('883c68e5794b308a139706fea4549c9f8a7573d7e17d82f0fd3e7c0c8c36b6e7'
            'SKIP'
            'SKIP'
            'a4106f04d8322836905c6d300c0fb54849063bbc258ef76e28acdbec7c1c4df4'
            '3101ef63935ca2e07457e0eccbd01e58b111f0194e998f541dbd503b1c393d8c')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver/vendor

  git clone "${srcdir}"/trezor-crypto

# disable static linking
  cd "${srcdir}"/$pkgname-$pkgver
  git apply "${srcdir}"/$pkgname.patch

# https://github.com/trezor/trezord/issues/32
# Generate Protocol Buffers
  cd "${srcdir}"/trezor-common/protob
  protoc --cpp_out="${srcdir}"/$pkgname-$pkgver/src/config config.proto

# prepare build dir
  install -d "${srcdir}"/$pkgname-$pkgver/build
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver/build

  cmake -DCMAKE_BUILD_TYPE=Release ..
  make
  cd "${srcdir}"/$pkgname-$pkgver
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
