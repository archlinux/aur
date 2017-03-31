# Maintainer: Jan Wozniak <wozniak.jan@gmail.com>

pkgname=riakts
pkgver=1.5.2
pkgrel=1
pkgdesc='Distributed NoSQL key/value store optimized for time series data'
arch=('i686' 'x86_64')
license=('APACHE')
url=http://docs.basho.com/riak/ts/"$pkgver"/downloads/
conflicts=('tsung', 'riak')
makedepends=('erlang-basho' 'java-environment')
optdepends=('jdk7-openjdk')
options=('!makeflags')
backup=('opt/riakts/etc/riak.conf')
install='riakts.install'
source=(
    "http://s3.amazonaws.com/downloads.basho.com/riak_ts/1.5/${pkgver}/riak_ts-${pkgver}.tar.gz"
    'riakts.service'
)
md5sums=('3b057d00a1ac3101a414071e69b52ee5'
         '370ce648bfed4ac00db20178f7a6735b')

build() {
  cd "$srcdir/riak_ts-$pkgver"

  msg 'Building...'
  unset LDFLAGS
  make locked-deps
  make rel
}

package() {
  cd "$srcdir/riak_ts-$pkgver"
  
  install -d "$pkgdir/opt"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/var/log"
  install -d "$pkgdir/etc"
  install -d "$pkgdir/usr/share/doc"

  cp -a "rel/riak" "$pkgdir/opt/$pkgname"
  chmod -R 755 "$pkgdir/opt/$pkgname/bin"
  ln -s /opt/$pkgname/log "$pkgdir/var/log/riak"
  ln -s /opt/$pkgname/etc "$pkgdir/etc/riak"

  local sb="#!/bin/sh
# -*- tab-width:4;indent-tabs-mode:nil -*-
# ex: ts=4 sw=4 et
"

  echo "$sb/opt/$pkgname/bin/riak \"\$@\"" > "$pkgdir/usr/bin/riak"
  chmod 755 "$pkgdir/usr/bin/riak"
  echo "$sb/opt/$pkgname/bin/riak-admin \"\$@\"" > "$pkgdir/usr/bin/riak-admin"
  chmod 755 "$pkgdir/usr/bin/riak-admin"
  echo "$sb/opt/$pkgname/bin/riak-debug \"\$@\"" > "$pkgdir/usr/bin/riak-debug"
  chmod 755 "$pkgdir/usr/bin/riak-debug"
  echo "$sb/opt/$pkgname/bin/riak-shell \"\$@\"" > "$pkgdir/usr/bin/riak-shell"
  chmod 755 "$pkgdir/usr/bin/riak-shell"
  echo "$sb/opt/$pkgname/bin/search-cmd \"\$@\"" > "$pkgdir/usr/bin/search-cmd"
  chmod 755 "$pkgdir/usr/bin/search-cmd"

  cp -R "doc/man" "$pkgdir/usr/share"
  cp -R "doc" "$pkgdir/usr/share/doc/$pkgname"
  rm -R "$pkgdir/usr/share/doc/$pkgname/man"
  chmod -R 755 "$pkgdir/usr/share"

  # install daemon
  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
