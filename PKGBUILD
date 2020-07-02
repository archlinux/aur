# Maintainer: Web Dawg <webdawg at gmail.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Paul Ezvan <paul@ezvan.fr>

pkgname=pnp4nagios
pkgver=0.6.26
pkgrel=6
pkgdesc="Nagios addon to create graphs from performance data"
arch=('i686' 'x86_64')
url="http://pnp4nagios.org"
license=('GPL')
depends=('perl' 'rrdtool' 'php' 'php-gd' 'libtool')
backup=('etc/httpd/conf/extra/pnp4nagios.conf' 'etc/pnp4nagios/config.php'
  'etc/pnp4nagios/config_local.php' 'etc/pnp4nagios/npcd.cfg'
  'etc/pnp4nagios/process_perfdata.cfg')
install=pnp4nagios.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
        npcd.service
        phpfix.patch
        nagiospass.patch
        pnp4nagios.install
        )
md5sums=('7a71b47f70e4e99d52c3b1df334e0342'
         '69f82fa4aeebc8c1164d67e4399c0932'
         '0d85f8cf7eba29dd3cf3f51b397041fb'
         '523a17c14cad60aafe6e6f6786a53a2a'
         '3b893852a8a59f2709b76c42d22585c1'
        )

prepare() {
    cd "$pkgname-$pkgver"
    #messed up the first patch, and it is a reversed patch
    patch -R --forward --strip=1 --input="${srcdir}/phpfix.patch"
    patch --forward --strip=1 --input="${srcdir}/nagiospass.patch"
}

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
