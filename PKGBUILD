# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=nrpe
pkgver=2.15
pkgrel=5
pkgdesc="Nagios Remote Plugin Executor"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
optdepends=("monitoring-plugins: common tools for monitoring using $pkgname")
replaces=('nagios-nrpe')
install=$pkgname.install
backup=('etc/nrpe/nrpe.cfg' 'etc/xinetd.d/nrpe')
url="http://exchange.nagios.org/directory/Addons/Monitoring-Agents/NRPE--2D-Nagios-Remote-Plugin-Executor/details"
source=(http://downloads.sourceforge.net/nagios/$pkgname-$pkgver.tar.gz
        $pkgname.service $pkgname.socket $pkgname@.service $pkgname.tmpfiles
        syslog.patch)
md5sums=('3921ddc598312983f604541784b35a50'
         '265512fbfc65f89eab1ca23d11ec749d'
         'f239bb4e7b885449d1f4067b209d89fd'
         '143278e9495821bd887cf84ce0f97af6'
         'd4b89b7ff8ffb187d44fedf294e7f5de'
         'e68e6460f5a2999635254dac64056679')

prepare() {
  cd $pkgname-$pkgver

  # fix directory permissions
  sed -i 's/775/755/' Makefile.in src/Makefile.in

  # fix run directory
  sed -i 's/nrpe.pid/nrpe\/nrpe.pid/' sample-config/nrpe.cfg.in

  # set the nrpe user and group
  sed -i 's/@nrpe_user@/31/' sample-config/nrpe.cfg.in
  sed -i 's/@nrpe_group@/31/' sample-config/nrpe.cfg.in

  # fix logging binary data to journal/syslog when ipv4 disconnects with debug=1
  patch -Np1 -i "$srcdir"/syslog.patch
}

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/nrpe \
    --libexecdir=/usr/lib/monitoring-plugins \
    --enable-command-args \
    --with-nrpe-user=0 --with-nrpe-group=0 \
    --with-nagios-user=0 --with-nagios-group=0
  
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir"/ install-daemon-config

  install -Dm644 sample-config/nrpe.xinetd "$pkgdir"/etc/xinetd.d/nrpe

  install -D -m644 "$srcdir"/nrpe.service \
    "$pkgdir"/usr/lib/systemd/system/nrpe.service
  install -D -m644 "$srcdir"/nrpe.socket \
    "$pkgdir"/usr/lib/systemd/system/nrpe.socket
  install -D -m644 "$srcdir"/nrpe@.service \
    "$pkgdir"/usr/lib/systemd/system/nrpe@.service
  install -D -m644 "$srcdir"/nrpe.tmpfiles \
    "$pkgdir"/usr/lib/tmpfiles.d/nrpe.conf

  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
  install -Dm644 README.SSL "$pkgdir"/usr/share/doc/$pkgname/README.SSL
  install -Dm644 SECURITY "$pkgdir"/usr/share/doc/$pkgname/SECURITY
  install -Dm644 LEGAL "$pkgdir"/usr/share/licenses/$pkgname/LEGAL
}
