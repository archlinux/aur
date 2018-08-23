# Maintainer: Arne Zachlod <arne@nerdkeller.org>

pkgname=bmx7
pkgver=r917.85841b0
pkgrel=1
pkgdesc="Bmx7 mesh routing network protocol including plugins"
arch=('i686' 'x86_64')
url="http://bmx6.net"
license=('GPL2')
depends=('glibc' 'json-c' 'wireless_tools' 'mbedtls')
makedepends=('git' 'make' 'gcc')
conflicts=('')
provides=('bmx7')

source=("$pkgname"::'git+https://github.com/bmx-routing/bmx7.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
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
  cd "$srcdir/$pkgname"
  install -D -m 755 bmx7 ${pkgdir}/usr/bin/bmx7
  install -D -m 755 lib/bmx7_json/bmx7_json.so ${pkgdir}/usr/lib/bmx7_json.so
  install -D -m 755 lib/bmx7_sms/bmx7_sms.so ${pkgdir}/usr/lib/bmx7_sms.so
#  install -D -m 755 lib/bmx7_table/bmx7_table.so ${pkgdir}/usr/lib/bmx7_table.so
  install -D -m 755 lib/bmx7_topology/bmx7_topology.so ${pkgdir}/usr/lib/bmx7_topology.so
  install -D -m 755 lib/bmx7_tun/bmx7_tun.so ${pkgdir}/usr/lib/bmx7_tun.so
  install -D -m 755 lib/bmx7_evil/bmx7_evil.so ${pkgdir}/usr/lib/bmx7_evil.so
  install -D -m 755 lib/bmx7_http_info/bmx7_http_info.so ${pkgdir}/usr/lib/bmx7_http_info.so
}
