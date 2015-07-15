# Maintainer: Pau Escrich <p4u@dabax.net>

pkgname=bmx6
pkgver=r662.8f26909
pkgrel=1
pkgdesc="Bmx6 mesh routing network daemon including JSON, SMS and Table plugins"
arch=('i686' 'x86_64')
url="http://bmx6.net"
license=('GPL2')
depends=('glibc' 'json-c')
makedepends=('git' 'make' 'gcc')
conflicts=('')
provides=('bmx6')

source=("$pkgname"::'git+https://github.com/axn/bmx6')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
  #JSON plugin
  sed -i s/"json\/json.h"/"json-c\/json.h"/g lib/bmx6_json/json.c
  make -C lib/bmx6_json/
  #SMS plugin
  make -C lib/bmx6_sms/
  #Table plugin
  make -C lib/bmx6_table/
}

  
package() {
  cd "$srcdir/$pkgname"
  install -D -m 755 bmx6 ${pkgdir}/usr/sbin/bmx6 
  install -D -m 755 lib/bmx6_json/bmx6_json.so ${pkgdir}/usr/lib/bmx6_json.so 
  install -D -m 755 lib/bmx6_sms/bmx6_sms.so ${pkgdir}/usr/lib/bmx6_sms.so 
  install -D -m 755 lib/bmx6_table/bmx6_table.so ${pkgdir}/usr/lib/bmx6_table.so 
}
