# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ian Stride <ianstride@gmail.com>
# Contributor: Roberto Catini <roberto.catini@gmail.com>

pkgname=rippled
pkgrel=1
pkgver=1.9.2
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/XRPLF/rippled"
license=('ISC')
backup=("etc/$pkgname/rippled.cfg" "etc/$pkgname/validators.txt")
depends=('protobuf' 'boost-libs' 'libarchive' 'libsecp256k1' 'rocksdb>=6.27')
makedepends=('git' 'cmake' 'boost' 'clang' 'doxygen')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        "$pkgname.install"
        "$pkgname.sysusers"
        "0001-cflag_werror_format-security.patch"
        "0002-service_execstart_paths_security_and_sandboxing.patch")
sha512sums=('55133a4e34d7db61f219fbd6e235ff31c63efbc576c8d48c42ea43aebeb90e1cc0565de076503f43c187a20f296e6d2f930a933f7599fbda537f06be1a87793b'
            '0c50bbd6b790163ca77ab6b8f5a078049dafe69f3818f05c8de3db626227c20cb55fbeaf38ca7594ce3a4f82156319ab69ccf24ca2615a278459f10a3ad7a04c'
            'bf651f870dc788a53960b950f1d069a2775fb806399c11b4e96499c26e325c844120bf7a1698a9482621b5634d2c7202b5917c582fd8a53002b2c9fe4caf6bae'
            '826c1233d10339176267cbd6ef394e3b4647630a074f2c4cdade7ee683319e01ea45209037cbce7acef7e97885adce7250f23d65174baca65f40a4aa2ef6b0fb'
            'fc841883eb6fb74a8ebbff8bccfd042022db533f4b44595e43680b048a7cead6532704538f2d22c6d04349d2472692bf3b5fc091dd454fa3d3cf37c88acb2c7e')

prepare() {
  cd "$pkgname-$pkgver"
  patch -N -p1 -i "$srcdir/0001-cflag_werror_format-security.patch"
  patch -N -p1 -i "$srcdir/0002-service_execstart_paths_security_and_sandboxing.patch"
}

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev \
    -Dtests=OFF \
    -Dstatic=OFF
  cmake --build build
}

#check() {
#  ./build/rippled --unittest
#}

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
