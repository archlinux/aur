# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Saleem Rashid <spudowiar@outlook.com>

pkgname=trezord
pkgver=1.2.1
pkgrel=2
_commitcrypto='95a522bf1a453880050521661258d7943e966d1f' #Nov 3, 2017
_commitcommon='8aca4dd2895b4a16c84f59bb45697129608580f6' #Dec 2, 2017
pkgdesc='TREZOR Communication Daemon'
arch=('i686' 'x86_64')
url='https://github.com/trezor'
license=('LGPL3')
depends=('boost-libs' 'protobuf' 'libmicrohttpd' 'jsoncpp' 'libusb')
makedepends=('boost' 'cmake' 'git')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::https://github.com/trezor/$pkgname/archive/v$pkgver.tar.gz
        git+https://github.com/trezor/trezor-crypto.git#commit=$_commitcrypto
        git+https://github.com/trezor/trezor-common.git#commit=$_commitcommon
        $pkgname.sysusers
        $pkgname.patch)
sha256sums=('2ca6cffe9326a3bd29cf455abc58165c6193ff9090bf7d13e3908b48d7750408'
            'SKIP'
            'SKIP'
            'a4106f04d8322836905c6d300c0fb54849063bbc258ef76e28acdbec7c1c4df4'
            'dac0d34ec64cd10b7c8e38d3b4edbf761b1fc29e70af3f07427c4cbae5cbf87f')

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
