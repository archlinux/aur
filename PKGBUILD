# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=lib32-audit-git
_name=audit-userspace
pkgver=4.2.1.r13.g669bc32
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url="https://github.com/linux-audit/audit-userspace"
arch=(x86_64)
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
)
depends=(
  audit
  lib32-glibc
)
makedepends=(git)
provides=(
  libaudit.so
  lib32-audit
)
conflicts=(lib32-audit)
source=("git+$url.git")
sha512sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags --match='v[0-9]*' --abbrev=7 |
    sed -E 's/^v//; s/([^-]+)-([0-9]+)-g([0-9a-f]+)$/\1.r\2.g\3/'
}

prepare() {
  cd $_name
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

  cd $_name
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make -C common
  make -C lib
}

package() {
  make DESTDIR="$pkgdir" install -C $_name/lib
  install -vDm 644 $_name/{{README,SECURITY}.md,ChangeLog} -t "$pkgdir/usr/share/doc/$pkgname/"

  rm -r "$pkgdir"/usr/{include,share}
}
