# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ian Stride <ianstride@gmail.com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=rippled
pkgrel=2
pkgver=1.8.1
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/$pkgname/rippled.cfg" "etc/$pkgname/validators.txt")
depends=('protobuf' 'boost-libs' 'libarchive' 'libsecp256k1' 'snappy' 'rocksdb')
makedepends=('git' 'cmake' 'boost' 'clang' 'doxygen')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.service"
        "$pkgname.install"
        "cflag_werror_format-security.patch")
sha512sums=('87d770d32220f26d9724e46ea2080da9a1c915cd30203cac757163ab0ced44b51047acc4f495f950e2f28a9c9c75d510e03e3ff1918cf2429f98b3f8bbcbd3d7'
            '4bd5964aac94df0f5cc9a6f177df07cacb71b1df5908ea6dc7c351103ca027688021f4ece184a7b7c5166bac1b4cc0e99cfd79e7a44ebf674618ad7a2f6b5a5a'
            '0c50bbd6b790163ca77ab6b8f5a078049dafe69f3818f05c8de3db626227c20cb55fbeaf38ca7594ce3a4f82156319ab69ccf24ca2615a278459f10a3ad7a04c'
            '826c1233d10339176267cbd6ef394e3b4647630a074f2c4cdade7ee683319e01ea45209037cbce7acef7e97885adce7250f23d65174baca65f40a4aa2ef6b0fb')

prepare() {
  mkdir -p build
  patch -d $pkgname-$pkgver -p1 -i "$srcdir"/cflag_werror_format-security.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver -Dstatic=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build .
}

check() {
  ./build/rippled --unittest
}

package() {
  install -D build/rippled "$pkgdir"/usr/bin/rippled
  install -D -m644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  cd $pkgname-$pkgver
  install -D -m644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 cfg/rippled-example.cfg "$pkgdir"/etc/$pkgname/rippled.cfg
  install -D -m644 cfg/validators-example.txt "$pkgdir"/etc/$pkgname/validators.txt
}

# vim:set ts=2 sw=2 et:
