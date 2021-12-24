# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ian Stride <ianstride@gmail.com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=rippled
pkgrel=2
pkgver=1.8.2
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/$pkgname/rippled.cfg" "etc/$pkgname/validators.txt")
depends=('protobuf' 'boost-libs' 'libarchive' 'libsecp256k1' 'rocksdb')
makedepends=('git' 'cmake' 'boost' 'clang' 'doxygen')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.install"
        "$pkgname.sysusers"
        "0001-cflag_werror_format-security.patch"
        "0002-service_execstart_paths_security_and_sandboxing.patch")
sha512sums=('a18f5eb9930586b49e6cbdae5edebf8f268b9c114b068543734a90282c5e5367c26d1bc6e2a31a6c42e294a763b5e9fa79792c580d049195b755b1af719496f2'
            '0c50bbd6b790163ca77ab6b8f5a078049dafe69f3818f05c8de3db626227c20cb55fbeaf38ca7594ce3a4f82156319ab69ccf24ca2615a278459f10a3ad7a04c'
            'bf651f870dc788a53960b950f1d069a2775fb806399c11b4e96499c26e325c844120bf7a1698a9482621b5634d2c7202b5917c582fd8a53002b2c9fe4caf6bae'
            '826c1233d10339176267cbd6ef394e3b4647630a074f2c4cdade7ee683319e01ea45209037cbce7acef7e97885adce7250f23d65174baca65f40a4aa2ef6b0fb'
            'fc841883eb6fb74a8ebbff8bccfd042022db533f4b44595e43680b048a7cead6532704538f2d22c6d04349d2472692bf3b5fc091dd454fa3d3cf37c88acb2c7e')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/0001-cflag_werror_format-security.patch"
  patch -p1 -i "$srcdir/0002-service_execstart_paths_security_and_sandboxing.patch"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -Dstatic=OFF
  cmake --build build
}

check() {
  ./build/rippled --unittest
}

package() {
  install -D build/rippled "$pkgdir/usr/bin/rippled"
  install -D -m644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  cd "$pkgname-$pkgver"
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 cfg/rippled-example.cfg "$pkgdir/etc/$pkgname/rippled.cfg"
  install -D -m644 cfg/validators-example.txt "$pkgdir/etc/$pkgname/validators.txt"
  install -D -m644 Builds/containers/shared/rippled.service "$pkgdir/usr/lib/systemd/system/rippled.service"
}

# vim:set ts=2 sw=2 et:
