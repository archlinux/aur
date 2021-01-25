# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Thomas Bächler <thomas@archlinux.org>
# Contributor: Mykyta Poturai <ddone@aruko.org>

pkgname=watchdog
pkgver=5.16
pkgrel=2
pkgdesc="Watchdog daemon"
arch=('x86_64' 'aarch64' 'armv7h')
url="http://sourceforge.net/projects/watchdog"
license=('GPL')
depends=('glibc')
backup=(etc/watchdog.conf)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz
        watchdog.systemd
        watchdog.logrotate)
md5sums=('1b4f51cabc64d1bee2fce7cdd626831f'
         '06677f094ec76b7fbb7b0db141209dec'
         '6430e9071aa724918b47f8c3b0412a5f')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure \
	--prefix=/usr \
	--sbindir=/usr/bin \
	--mandir=/usr/share/man \
	--sysconfdir=/etc \
	--localstatedir=/var \
	--with-pidfile=/run/watchdog.pid \
	--with-ka_pidfile=/run/wd_keepalive.pid \
	--disable-nfs
  
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"
  install -D -m644 "${srcdir}"/watchdog.systemd "${pkgdir}"/usr/lib/systemd/system/watchdog.service
  install -D -m644 "${srcdir}"/watchdog.logrotate "${pkgdir}"/etc/logrotate.d/watchdog
}
