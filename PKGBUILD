# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=nrpe
pkgver=3.0.1
pkgrel=4
pkgdesc="Nagios Remote Plugin Executor"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
optdepends=("monitoring-plugins: common tools for monitoring using $pkgname")
install=$pkgname.install
backup=('etc/nrpe/nrpe.cfg' 'etc/xinetd.d/nrpe')
url="https://github.com/NagiosEnterprises/nrpe"
source=(https://github.com/NagiosEnterprises/nrpe/releases/download/$pkgver/$pkgname-$pkgver.tar.gz
        nrpe-0010-opensslv110-strict.patch
        nrpe-0011-opensslv110-nosslv2.patch)
sha256sums=('8f56da2d74f6beca1a04fe04ead84427e582b9bb88611e04e290f59617ca3ea3'
            '58ca691a11f5005631f4e940daa18c344b3d2f322184506d63cc1eb2633d30a3'
            'e4383c8261b7097a46d8fe54c97391767a4ef0107d551f55d71940469f5e433f')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../nrpe-0010-opensslv110-strict.patch
  patch -Np1 -i ../nrpe-0011-opensslv110-nosslv2.patch
}

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/nrpe \
    --libexecdir=/usr/lib/monitoring-plugins \
    --enable-command-args \
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

  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 README.SSL.md "$pkgdir"/usr/share/doc/$pkgname/README.SSL.md
  install -Dm644 SECURITY.md "$pkgdir"/usr/share/doc/$pkgname/SECURITY.md
  install -Dm644 LEGAL "$pkgdir"/usr/share/licenses/$pkgname/LEGAL

  # FS#52873
  sed -i 's/=31$/=nrpe/g' "$pkgdir"/etc/nrpe/nrpe.cfg

  # Tidy up
  chmod 755 "$pkgdir"/usr/lib/monitoring-plugins
  chown -R root:root "$pkgdir"/usr/lib/monitoring-plugins
  rm -f "$pkgdir"/usr/bin/nrpe-uninstall
  rm -rf "$pkgdir"/run
}
