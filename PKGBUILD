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
pkgver=4.1.2
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
sha512sums=('a47fec1041e11a76ad57b57bcf6e9b454188d95ec26cabf15e92e114d46c7c8f09ddb251d5aebef8bc7faacc6ccffe44c73543d8234af237548b4ad89a408fc3')
b2sums=('f71fec5698208b2dffe91525f4fa870658a9a16dab8ddd2c99c347eca14d4cf45b0900864f24913adb98891f5da656f5ebf0e0b0b60c7beedcd77ea0a836b697')

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
