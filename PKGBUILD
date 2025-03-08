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
pkgver=4.0.3
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=(x86_64)
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
)
depends=(
  audit
  lib32-glibc
  lib32-libldap
)
provides=(
  libaudit.so
)
source=(
  https://github.com/linux-audit/$_name/archive/v$pkgver/$_name-v$pkgver.tar.gz
)
sha512sums=('a20d2f832632fa844764086aac98c80f7fcb120ceeaae7472248e04eec0493981e31fd59f22c3f0dbff81ccbcd132b8297812f2b4cdb87b866c59aedf3611342')
b2sums=('35c5c45773b931d0751abf7e22130ce1217f96acb1192bd9351f54dc4f34e9a94fc42392287fd241bc76e7fac06b30e96ea34bfd7302a37a10851bd1e36cccc5')

prepare() {
  cd $_name-$pkgver
  autoreconf -fiv
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  local configure_options=(
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
