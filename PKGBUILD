# Maintainer: Celogeek <private-4zokpdq6@mrhyde.xyz>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Sigmund Lahn <sigmund@lahn.no>

pkgname=rethinkdb
pkgver=2.4.0
_node=6.11.0
pkgrel=7
pkgdesc='Distributed NoSQL database for realtime applications'
arch=(x86_64)
url=https://www.rethinkdb.com
license=(Apache)
depends=(curl)
makedepends=(clang boost jemalloc git python2 make)
backup=(etc/rethinkdb/instances.d/default.conf)
install=rethinkdb.install
options=(!emptydirs)
source=(
  $pkgname::git+https://github.com/rethinkdb/rethinkdb.git#commit=3ca96904192806817c73c3d533d774585ef90759
  https://nodejs.org/dist/v$_node/node-v$_node.tar.gz
  rethinkdb@.service
  rethinkdb.sysusers.d
  rethinkdb.tmpfiles.d
  mksnapshot_crash_fix.patch
  v8_g++7_build_fix.patch::https://github.com/nodejs/node/commit/66c1197f3aefd5b9f36533e6b617f2046acc2c0f.patch
  build_fix.patch
)
noextract=(node-v$_node.tar.gz)
sha512sums=('SKIP'
            'a298232f6393735f2d459eb23f78089dd7eb1bae4907dfe61b286ceb8f93d3131c2dd45f09643089d00e2a4bef0f35739c9c8984f88b34c0ab515793f38eda46'
            'd0e86e86010fafcfdad7a58fe9ed9e93deefb1ab803aa283f60cccaf7a0ee11990c59b9ab01872b1c97b08418d7b53064e938b428e50a310442b32aa385277d9'
            'cab680a7e765e0a844b72ab3a57f19f3268d9a717bbe19230bd79537f0424179a56037c368326d2173a4a9cde075a67c85ce9b5a32733afb7d44806df1eac0ac'
            '112bc0f9ecfdfae6efba5d8cc3f773085b3f345d33d350188dc70609c425e6c656a0a3069ae5c66cdc684a94fd442e990a88c0ca8d1875f085f660c76c3d7250'
            '8deea735b2c7b6fc0221a49e818d4347869330fa9e35a94c15d54f7bc64ac0b8a573906fea6cc64c05a177f3065c96d8b4d0e2a3724b6137d7f12ba7a7b419f7'
            '15f1f9508adef9cd14320b6649f3b766a0dd8dd478290424e9af6343a7fd64e246aafbbf2f19109e5812decb2f15dcb283fec57875bc50a540737441a0fd248d'
            'c5199d545ad4c77523b39a30c3b859c03261910c3226dfdf6c0d73c491ee96190745bc09ec349c49c4f41c7c52da9c2e59b9456a32bfe8d4aa78c1e29dd486bc')

prepare() {
  # There are a ton of hard dependencies on Python 2
  # Let's KISS and pretend `python` points to Python 2

  if [ ! -f bin/python ]
  then
    mkdir -p bin
    ln -s /usr/bin/python2 bin/python
  fi

  cd $pkgname

  patch -p0 < ../mksnapshot_crash_fix.patch
  patch -p1 < ../build_fix.patch

  PATH="$srcdir"/bin:$PATH ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --dynamic jemalloc \
    --allow-fetch \
    --fetch npm \
    --fetch protobuf \
    CXX=clang++

  # Manually fetch the Node version used, so we can patch it
  if [ ! -d external/node_$_node ]
  then
    cd external
    tar zxfp ../../node-v$_node.tar.gz
    mv node{-v,_}$_node
    cd node_$_node
    patch -p1 < "$srcdir"/v8_g++7_build_fix.patch
  fi
}

build() {
  cd $pkgname
  PATH="$srcdir"/bin:$PATH make -j`nproc`
}

package() {
  cd $pkgname

  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/etc/init.d

  mv "$pkgdir"/etc/rethinkdb/default.conf.sample "$pkgdir"/etc/rethinkdb/instances.d/default.conf
  sed -r 's#\# (directory=.*)#\1#' -i "$pkgdir"/etc/rethinkdb/instances.d/default.conf

  install -Dm 644 ../rethinkdb@.service -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 ../rethinkdb.sysusers.d "$pkgdir"/usr/lib/sysusers.d/rethinkdb.conf
  install -Dm 644 ../rethinkdb.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/rethinkdb.conf
}
