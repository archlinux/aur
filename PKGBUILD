# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Paul Ezvan <paul@ezvan.fr>

pkgname=pnp4nagios
pkgver=0.6.24
pkgrel=1
pkgdesc="Nagios addon to create graphs from performance data"
arch=('i686' 'x86_64')
url="http://pnp4nagios.org"
license=('GPL')
depends=('perl' 'rrdtool' 'php' 'php-gd' 'libtool')
backup=('etc/httpd/conf/extra/pnp4nagios.conf' 'etc/pnp4nagios/config.php'
  'etc/pnp4nagios/config_local.php' 'etc/pnp4nagios/npcd.cfg'
  'etc/pnp4nagios/process_perfdata.cfg')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        npcd.service)
md5sums=('eeffd5d0a2dbaa1693cb10d52034239d'
         '69f82fa4aeebc8c1164d67e4399c0932')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr/share/$pkgname \
  --sysconfdir=/etc/$pkgname \
  --libexecdir=/usr/lib/$pkgname \
  --localstatedir=/var/lib/$pkgname \
  --bindir=/usr/bin \
  --with-httpd-conf=/etc/httpd/conf/extra \
  --with-nagios-user=0 --with-nagios-group=0

  make all
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install install-webconf install-config

  mv "$pkgdir"/usr/share/$pkgname/man "$pkgdir"/usr/share/

  install -Dm644 "$srcdir"/npcd.service \
    "$pkgdir"/usr/lib/systemd/system/npcd.service
}
