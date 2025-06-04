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
pkgver=4.0.5
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
sha512sums=('14fa19922cf6436284e1448d5a0e069ce5066d2d49d28679fe3ad019be60c133aee6e345b36e0f482ea1fdeadad7d78676f931aab1c25b91a2d0b445dce3eedf')
b2sums=('eaa3106f4ec4fae9a356e33717922131975c5421977af4baad9364f80a4c72a07d725f32b2bf39f49b6ff6063365fd3f047b3eb209c231abaaff67a4506ec2f7')

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
