# Maintainer: Arne Zachlod <arne@nerdkeller.org>

pkgname=bmx7
pkgver=v7.1.1.r0.g91d6651
pkgrel=2
pkgdesc="Bmx7 mesh routing network protocol including plugins"
arch=('i686' 'x86_64')
url="https://github.com/bmx-routing/bmx7"
license=('GPL2')
depends=('glibc' 'json-c' 'wireless_tools' 'mbedtls' 'zlib')
makedepends=('git' 'make' 'gcc')
provides=('bmx7')

source=("$pkgname"::'git+https://github.com/bmx-routing/bmx7.git'
        '0001-Linux-changed-the-header-file-for-SIOCGSTAMP.patch')
sha256sums=('SKIP'
            'd95400340bcd14c3b18b3478abf517210dc15d8693241760b46450bb1ec76db0')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch --forward --strip=1 --input="${srcdir}/0001-Linux-changed-the-header-file-for-SIOCGSTAMP.patch"
}

build() {
  cd "$srcdir/$pkgname/src"
  make
  #JSON plugin
  make -C lib/bmx7_json/
  #SMS plugin
  make -C lib/bmx7_sms/
  #Table plugin
#  make -C lib/bmx7_table/
  #topology plugin
  make -C lib/bmx7_topology/
  #tun plugin
  make -C lib/bmx7_tun/
  #evil plugin
  make -C lib/bmx7_evil/
  #http-info plugin
  make -C lib/bmx7_http_info/
}

package() {
  install -D -m 644 ${startdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
  cd "$srcdir/$pkgname/src"
  install -D -m 755 bmx7 ${pkgdir}/usr/bin/bmx7
  install -D -m 755 lib/bmx7_json/bmx7_json.so ${pkgdir}/usr/lib/bmx7_json.so
  install -D -m 755 lib/bmx7_sms/bmx7_sms.so ${pkgdir}/usr/lib/bmx7_sms.so
#  install -D -m 755 lib/bmx7_table/bmx7_table.so ${pkgdir}/usr/lib/bmx7_table.so
  install -D -m 755 lib/bmx7_topology/bmx7_topology.so ${pkgdir}/usr/lib/bmx7_topology.so
  install -D -m 755 lib/bmx7_tun/bmx7_tun.so ${pkgdir}/usr/lib/bmx7_tun.so
  install -D -m 755 lib/bmx7_evil/bmx7_evil.so ${pkgdir}/usr/lib/bmx7_evil.so
  install -D -m 755 lib/bmx7_http_info/bmx7_http_info.so ${pkgdir}/usr/lib/bmx7_http_info.so
}
