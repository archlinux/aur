# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Sigmund Lahn <sigmund@lahn.no>

pkgname=rethinkdb
pkgver=2.4.2
pkgrel=2
pkgdesc='Distributed NoSQL database for realtime applications'
arch=(x86_64)
url=https://www.rethinkdb.com
license=(Apache)
depends=(curl jemalloc openssl protobuf zlib)
makedepends=(clang git python make boost)
backup=(etc/rethinkdb/instances.d/default.conf)
install=rethinkdb.install
options=(!emptydirs)
source=(
  https://github.com/rethinkdb/rethinkdb/archive/refs/tags/v2.4.2.tar.gz
  rethinkdb@.service
  rethinkdb.sysusers.d
  rethinkdb.tmpfiles.d
  fix1.patch::https://github.com/rethinkdb/rethinkdb/commit/9ab11f5c9aef0a9d14b92aefd1defa07ad27049e.patch
  fix2.patch::https://github.com/rethinkdb/rethinkdb/commit/0d504ef964cb5f86aa90afe396d701707dd130e7.patch
)
sha512sums=('afb01bd273f7ec76e96db9af601467ed63131e1078647e80ea4bec3f026f86e2d3c7614634db4d504cc6f6e9251ab1a1c8bf3b4130ef921b0960b00c76740542'
            'd0e86e86010fafcfdad7a58fe9ed9e93deefb1ab803aa283f60cccaf7a0ee11990c59b9ab01872b1c97b08418d7b53064e938b428e50a310442b32aa385277d9'
            'cab680a7e765e0a844b72ab3a57f19f3268d9a717bbe19230bd79537f0424179a56037c368326d2173a4a9cde075a67c85ce9b5a32733afb7d44806df1eac0ac'
            '112bc0f9ecfdfae6efba5d8cc3f773085b3f345d33d350188dc70609c425e6c656a0a3069ae5c66cdc684a94fd442e990a88c0ca8d1875f085f660c76c3d7250'
            'da3c2ec3366df96d6d78ae2e66bfd6c0192574a23f5a7b351aea4c7eb78009226ee3c194c00f636fcee48b8a730cc246d57c27a8bf425c1f47475b07b5525a91'
            '48faf503ab6b93cca7f2c3e531b41115b57bff50183f6753d0bc3f21214178164c510a7974ad4205634dcb4da0434ce4aac5ddabe671349686c25c2e87968be1')

prepare() {
  # There are a ton of hard dependencies on Python 2
  # Let's KISS and pretend `python` points to Python 2

  cd $pkgname-$pkgver
  patch -p1 < "$srcdir"/fix1.patch
  patch -p1 < "$srcdir"/fix2.patch
  echo $pkgver > VERSION

  PATH="$srcdir"/bin:$PATH ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --dynamic jemalloc \
    CXX=clang++
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
