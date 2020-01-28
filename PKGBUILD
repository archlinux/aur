# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=nrpe
pkgver=4.0.0
pkgrel=1
pkgdesc="Nagios Remote Plugin Executor"
arch=('x86_64')
license=('GPL')
depends=('openssl-1.0')
optdepends=("monitoring-plugins: common tools for monitoring using $pkgname")
makedepends=('procps-ng')
install=$pkgname.install
backup=('etc/nrpe/nrpe.cfg' 'etc/xinetd.d/nrpe')
url="https://github.com/NagiosEnterprises/nrpe"
source=(https://github.com/NagiosEnterprises/nrpe/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz
        nrpe.sysusers)
md5sums=('e4cee2daed0ccdadb09693c55c4837d1'
         '079d1f8c06598303be95151a8985927b')

build() {
  cd $pkgname-$pkgver

  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  export sslbin=/usr/bin/openssl-1.0
  export ssl_inc_dir=/usr/include/openssl-1.0/openssl

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/nrpe \
    --libexecdir=/usr/lib/monitoring-plugins \
    --with-nrpe-user=31 --with-nrpe-group=31 \
    --with-nagios-user=31 --with-nagios-group=31 \
    --with-piddir=/run/nrpe

  make all
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 sample-config/nrpe.cfg "$pkgdir"/etc/nrpe/nrpe.cfg
  install -Dm644 startup/default-service "$pkgdir"/usr/lib/systemd/system/nrpe.service
  install -Dm644 startup/default-socket "$pkgdir"/usr/lib/systemd/system/nrpe.socket
  install -Dm644 startup/default-xinetd "$pkgdir"/etc/xinetd.d/nrpe
  install -Dm644 startup/tmpfile.conf "$pkgdir"/usr/lib/tmpfiles.d/nrpe.conf
  install -Dm644 "$srcdir"/nrpe.sysusers "$pkgdir"/usr/lib/sysusers.d/nrpe.conf

  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 README.SSL.md "$pkgdir"/usr/share/doc/$pkgname/README.SSL.md
  install -Dm644 SECURITY.md "$pkgdir"/usr/share/doc/$pkgname/SECURITY.md
  install -Dm644 LEGAL "$pkgdir"/usr/share/licenses/$pkgname/LEGAL

  # FS#52873
  sed -i 's/=31$/=nrpe/g' "$pkgdir"/etc/nrpe/nrpe.cfg "$pkgdir"/usr/lib/systemd/system/nrpe.service

  # Tidy up
  chmod -R 755 "$pkgdir"/usr/lib/monitoring-plugins
  chown -R root:root "$pkgdir"/usr/lib/monitoring-plugins
  rm -f "$pkgdir"/usr/bin/nrpe-uninstall
  rm -rf "$pkgdir"/run
}
