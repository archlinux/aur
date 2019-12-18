# Maintainer: zlowly <zlowly@gmail.com>
pkgname=smartdns-git
_pkgname=${pkgname%-git}
pkgver=r288.d6c3465
pkgrel=1
pkgdesc="Local DNS server that accepts DNS query requests from local clients, obtains DNS query results from multiple upstream DNS servers, and returns the fastest access results to clients."
arch=("x86_64")
url="https://github.com/pymumu/smartdns"
license=("GPL3")
depends=('openssl-1.0')
makedepends=('git') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("smartdns::git+https://github.com/pymumu/smartdns.git" "${_pkgname}.patch")
backup=("etc/smartdns/smartdns.conf")
md5sums=('SKIP'
         '2481e2bdb5bf5c140107fef66f13151f')
pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir"
  patch -p1 "${_pkgname}/systemd/smartdns.service" < "${_pkgname}.patch"
}
build() {
	cd "$srcdir/${_pkgname}"
  make -C ./src clean 
  make -C ./src all VER=$pkgver
}
package() {
	cd "$srcdir/${_pkgname}"
  install -Dm755 src/smartdns "$pkgdir/usr/bin/smartdns"
  install -Dm644 etc/smartdns/smartdns.conf "$pkgdir/etc/smartdns/smartdns.conf"
  install -Dm644 etc/default/smartdns "$pkgdir/etc/default/smartdns"
  install -Dm644 systemd/smartdns.service "$pkgdir/usr/lib/systemd/system/smartdns.service"
}
