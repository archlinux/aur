# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Sigmund Lahn <sigmund@lahn.no>

pkgname=rethinkdb
pkgver=2.4.0
_node=6.11.0
pkgrel=1
pkgdesc='Distributed NoSQL database for realtime applications'
arch=(x86_64)
url=https://www.rethinkdb.com
license=(Apache)
depends=(protobuf curl)
makedepends=(boost python2)
backup=(etc/rethinkdb/instances.d/default.conf)
install=rethinkdb.install
options=(!emptydirs)
source=(
  https://download.rethinkdb.com/dist/$pkgname-$pkgver.tgz
  https://nodejs.org/dist/v$_node/node-v$_node.tar.gz
  rethinkdb@.service
  rethinkdb.sysusers.d
  rethinkdb.tmpfiles.d
  mksnapshot_crash_fix.patch
  v8_g++7_build_fix.patch::https://github.com/nodejs/node/commit/66c1197f3aefd5b9f36533e6b617f2046acc2c0f.patch
)
noextract=(node-v$_node.tar.gz)
sha512sums=('a0301f4eee6652307ca8481a658b4494fa2b3d2151ab14afca94f50d004271be51cb487a082944c1803473086d60282fdcc53c24e793f7051088d2a3596cf1fe'
            'a298232f6393735f2d459eb23f78089dd7eb1bae4907dfe61b286ceb8f93d3131c2dd45f09643089d00e2a4bef0f35739c9c8984f88b34c0ab515793f38eda46'
            'd0e86e86010fafcfdad7a58fe9ed9e93deefb1ab803aa283f60cccaf7a0ee11990c59b9ab01872b1c97b08418d7b53064e938b428e50a310442b32aa385277d9'
            'cab680a7e765e0a844b72ab3a57f19f3268d9a717bbe19230bd79537f0424179a56037c368326d2173a4a9cde075a67c85ce9b5a32733afb7d44806df1eac0ac'
            '112bc0f9ecfdfae6efba5d8cc3f773085b3f345d33d350188dc70609c425e6c656a0a3069ae5c66cdc684a94fd442e990a88c0ca8d1875f085f660c76c3d7250'
            '8deea735b2c7b6fc0221a49e818d4347869330fa9e35a94c15d54f7bc64ac0b8a573906fea6cc64c05a177f3065c96d8b4d0e2a3724b6137d7f12ba7a7b419f7'
            '346020fea3e10628c687dd89fc2d9aec97e1b6734fd83828d390b4187c96c085a6e99efedb8b2f87491a4c1237de06c73aee0d0671c259935eedaddcf7f505f1')

prepare() {
  # There are a ton of hard dependencies on Python 2
  # Let's KISS and pretend `python` points to Python 2
  mkdir bin
  ln -s /usr/bin/python2 bin/python

  cd $pkgname-$pkgver

  patch -p0 < ../mksnapshot_crash_fix.patch

  PATH="$srcdir"/bin:$PATH ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --allow-fetch

  # Manually fetch the Node version used, so we can patch it
  cd external
  tar zxfp ../../node-v$_node.tar.gz
  mv node{-v,_}$_node
  cd node_$_node
  patch -p1 < "$srcdir"/v8_g++7_build_fix.patch
}

build() {
  cd $pkgname-$pkgver
  PATH="$srcdir"/bin:$PATH make -j`nproc`
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/etc/init.d

  mv "$pkgdir"/etc/rethinkdb/default.conf.sample "$pkgdir"/etc/rethinkdb/instances.d/default.conf
  sed -r 's#\# (directory=.*)#\1#' -i "$pkgdir"/etc/rethinkdb/instances.d/default.conf

  install -Dm 644 ../rethinkdb@.service -t "$pkgdir"/usr/lib/systemd/system
  install -Dm 644 ../rethinkdb.sysusers.d "$pkgdir"/usr/lib/sysusers.d/rethinkdb.conf
  install -Dm 644 ../rethinkdb.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/rethinkdb.conf
}
