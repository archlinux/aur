# Maintainer: Rains <rains31@gmail.com>

pkgname=shadowvpn
_pkgname=ShadowVPN
pkgver=0.2.2
pkgrel=1
pkgdesc="A fast, safe VPN based on libsodium"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/rains31/${_pkgname}"
license=('MIT')
depends=('sh' 'libsodium')
provides=("shadowvpn")
conflicts=("shadowvpn")
makedepends=('m4' 'automake' 'autoconf')
options=('!emptydirs')
backup=('etc/shadowvpn/client.conf'
        'etc/shadowvpn/client_down.sh'
        'etc/shadowvpn/client_up.sh'
        'etc/shadowvpn/server.conf'
        'etc/shadowvpn/server_down.sh'
        'etc/shadowvpn/server_up.sh'
        'lib/systemd/system/shadowvpn@.service')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/rains31/ShadowVPN/archive/${pkgver}.tar.gz")
md5sums=('f706e7a4d32156d6490f43f1571ef01c')

prepare() {
  cd ${_pkgname}-${pkgver}
  rm -rf libsodium

  sed -e 's|SUBDIRS = ../libsodium||' \
      -e 's|AM_CFLAGS = .*libsodium.*$|AM_CFLAGS = -lsodium|' \
      -e 's|libshadowvpn_la_LIBADD = ../libsodium/src/libsodium/libsodium.la||' \
      -i src/Makefile.am
  
  sed -e 's|AC_CONFIG_SUBDIRS([libsodium])||' \
      -i configure.ac 
}

build() {
  cd ${_pkgname}-${pkgver}
  ./autogen.sh
  ./configure --sysconfdir=/etc --disable-static --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
  install -Dm644 samples/shadowvpn@.service "$pkgdir"/usr/lib/systemd/system/shadowvpn@.service
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}
