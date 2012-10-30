# $Id: PKGBUILD 79038 2012-10-29 14:31:32Z spupykin $
# Upstream Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Upstream Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: nofxx <x@<nick>.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_basepkgname=redis
pkgname=binx32-redis
pkgver=2.6.2
pkgrel=1.1
pkgdesc="Advanced key-value store (x32 ABI)"
arch=('x86_64')
url="http://redis.io/"
license=('BSD')
depends=('bash' 'libx32-glibc' "${_basepkgname}=${pkgver}")
makedepends=('gcc-multilib-x32>=3.1' 'make' 'pkgconfig')
backup=("etc/redis-x32.conf"
	"etc/logrotate.d/redis-x32")
source=("http://redis.googlecode.com/files/${_basepkgname}-${pkgver}.tar.gz"
	"redis.d"
	"redis.service"
	"redis.logrotate")
md5sums=('4f788dfb3ee86c7e864dfe537870bb5a'
         '2219168289fc918cb29718399a50a036'
         'a9ebb2cdc0c1166ec9684bf3a891e41e'
         '5a51ae6c10564edb716a93f22e821d67')

build() {
  cd "$srcdir/${_basepkgname}-${pkgver}"
  make MALLOC=libc CC="gcc -mx32"
}

package() {
  cd "$srcdir/${_basepkgname}-${pkgver}"
  mkdir -p $pkgdir/usr/bin
  make INSTALL_BIN="$pkgdir/usr/bin" PREFIX=/usr install

  for _x in ${pkgdir}/usr/bin/*; do mv $_x $_x-x32; done
  
  install -D -m755 "$srcdir/redis.d" "$pkgdir/etc/rc.d/redis-x32"
  install -Dm644 "$srcdir"/redis.service "$pkgdir"/usr/lib/systemd/system/redis-x32.service
  install -Dm644 "$srcdir/redis.logrotate" "$pkgdir/etc/logrotate.d/redis-x32"
  sed -i 's|daemonize no|daemonize yes|;s|dir \./|dir /var/lib/redis-x32/|;s|logfile stdout|logfile /var/log/redis-x32.log| ' $srcdir/${_basepkgname}-${pkgver}/redis.conf
  sed -i 's|pidfile /var/run/redis.pid|pidfile /var/run/redis-x32.pid|;s|port 6379|port 6378| ' $srcdir/${_basepkgname}-${pkgver}/redis.conf

  install -D -m644 "$srcdir/${_basepkgname}-${pkgver}/redis.conf" "$pkgdir/etc/redis-x32.conf"

  # install license
  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s ${_basepkgname} "${pkgdir}"/usr/share/licenses/${pkgname}
}
