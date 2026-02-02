# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=lib32-audit
_name=audit-userspace
pkgver=4.1.3
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url="https://github.com/linux-audit/audit-userspace"
arch=(x86_64)
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
)
depends=(
  audit=$pkgver
  lib32-glibc
)
provides=(
  libaudit.so
)
source=(
  $url/archive/v$pkgver/$_name-v$pkgver.tar.gz
)
sha512sums=('4ebdfaebb89440bd76d1f715aa9f2f261b453f51c66ae9c4c7ad650cd361268fe2415c33fe7913ec4986d98ccbd457e15734d0aae606b5dccf316b66276a13cb')
b2sums=('ef3492ab991434ca378d351964f07e2698e8ad3e75fb2fc8fc9c925edc82b2645e2bd8e6298646fb47b8eb6dfa1a255191e211c19dfaabe0a822346181c1b2a2')

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  local configure_options=(
    --disable-zos-remote
    --libdir=/usr/lib32
    --libexecdir=/usr/lib32/audit
    --prefix=/usr
    --runstatedir=/run
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-python3=no
  )

  cd $_name-$pkgver
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C common
  make -C lib
}

package() {
  make DESTDIR="$pkgdir" install -C $_name-$pkgver/lib
  install -vDm 644 $_name-$pkgver/{{README,SECURITY}.md,ChangeLog} -t "$pkgdir/usr/share/doc/$pkgname/"

  rm -r "$pkgdir"/usr/{include,share}
}
