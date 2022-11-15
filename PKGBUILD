# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=nrpe
pkgver=4.1.0
pkgrel=2
pkgdesc="Nagios Remote Plugin Executor"
arch=('x86_64')
license=('GPL')
depends=('openssl')
optdepends=("monitoring-plugins: common tools for monitoring using $pkgname")
makedepends=('procps-ng')
install=$pkgname.install
backup=('etc/nrpe/nrpe.cfg' 'etc/xinetd.d/nrpe')
url="https://github.com/NagiosEnterprises/nrpe"
source=(https://github.com/NagiosEnterprises/nrpe/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz
        nrpe.sysusers)
sha256sums=('a1f14aa8aaf935b576cc55ab5d77b7cb9c920d7702aff44c9d18c4c841ef8ecc'
            '9430d6c7ccf9817f9c66eda8e2126b0b0fdad93fa17dee9227627c35a4101ad3')

build() {
  cd $pkgname-$pkgver

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
