# $Id$
# Maintainer:  Aaron West <awest@tamakizu.co.uk>

pkgname=pen
pkgver=0.33.0
pkgrel=1
pkgdesc='A highly scalable, highly available, robust load balancer for tcp and udp based protocols such as dns, http or smtp.'
arch=('i686' 'x86_64')
url='http://siag.nu/pen/'
license=('GPL2')
depends=('geoip' 'openssl')
backup=('etc/pen/conf/http.conf')
install=pen.install
source=("http://siag.nu/pub/pen/pen-${pkgver}.tar.gz"
	'pen-http.service'
	'http.conf'
	'pen.conf')
md5sums=('365f096781b72e285aae3eb34e58e184'
	'b5ffd7977eb6f98e6fc5a11a0c070370'
	'2b29437249160bda06f7d6a9e48ca4c9'
	'2479b1d49cb7d48ba9a90db8ce2dd13f')

build() {
  cd pen-${pkgver}
  ./configure --with-ssl=/etc/ssl/ --with-geoip --prefix=/usr 
  make 
}

package() {
  cd pen-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -D --mode=644 ${srcdir}/pen-http.service ${pkgdir}/usr/lib/systemd/system/pen-http.service
  install -D --mode=644 ${srcdir}/http.conf ${pkgdir}/etc/pen/conf/http.conf
  install -D --mode=644 ${srcdir}/pen.conf ${pkgdir}/usr/lib/tmpfiles.d/pen.conf
}

