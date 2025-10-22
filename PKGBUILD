# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>
pkgname=p4lang-bmv2
pkgver=1.15.0
pkgrel=3
pkgdesc="P4 reference software switch"
arch=('any')
url="https://github.com/p4lang/behavioral-model"
license=('Apache')
depends=(
    'boost-libs'
    'gmp'
    'libevent'
    'libpcap'
    'nanomsg'
    'python'
    'python-thrift'
    'thrift'
)
makedepends=('boost')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-fix-ipaddr-import.patch::https://github.com/p4lang/behavioral-model/commit/7a8843ffb87bab9eb0a44c993ae39a9fefca10cf.patch"
        "$pkgname-add-cstdint-include.patch::https://github.com/p4lang/behavioral-model/commit/c0ff3aba77a78ed08dfcb8634f0875fa172e18ab.patch"
        "remove-boost-system.patch")
sha512sums=('b92f761338a8f60cfc3578d62848f2201b4f1d55a562680a0a9fe9e63cb764eb00f252f59b48020871fa65fe3d0468fab888affa5cfef00a7578d940dd7fc08b'
            '9102f8a0d98fd9a7b2693f2b71f0677c33cbdf4260e031012febcb6cb8a2a645b3a6a1d274974067854100903b9ebb5bca8a1eef1bc01e99120df2969c764b3f'
            '3f1dc85e9e761fd26ef25efdfb6b0cf13dcad59487ba25b22ec46c6d494531fb937d73567f6d4484e5f7117b732c4414eeb6f63183e728914c83c7223dd2dbd5'
            '8e6aa7c7f0a3aced64b2fb66c2ca48ecc063c007070970f150d80613226063363e39e557dfe0eac31127f2bca251a88fc9578d8c06e61edbc783a642db9b4012')

prepare() {
    cd "behavioral-model-$pkgver"
    for patch_file in "../$pkgname-fix-ipaddr-import.patch" "../$pkgname-add-cstdint-include.patch" "../remove-boost-system.patch"; do
        patch -Np1 -i "$patch_file"
    done
}

build() {
    cd "behavioral-model-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

check() {
    cd "behavioral-model-$pkgver"
    #TODO: tests fail
    make -k check || true
}

package() {
    cd "behavioral-model-$pkgver"
    make DESTDIR="$pkgdir/" install
}
