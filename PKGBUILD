# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=nrpe
pkgver=2.15
pkgrel=2
pkgdesc="Nagios Remote Plugin Executor"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
optdepends=("monitoring-plugins: common tools for monitoring using $pkgname")
replaces=('nagios-nrpe')
options=(!libtool)
install="$pkgname.install"
backup=('etc/nrpe/nrpe.cfg' 'etc/xinetd.d/nrpe')
url="http://exchange.nagios.org/directory/Addons/Monitoring-Agents/NRPE--2D-Nagios-Remote-Plugin-Executor/details"
source=(http://downloads.sourceforge.net/nagios/$pkgname-$pkgver.tar.gz
        nrpe.service
        nrpe.socket
        nrpe@.service
        nrpe.tmpfiles
        nrpe.xinetd
        nrpe.cfg
        syslog.patch)
md5sums=('3921ddc598312983f604541784b35a50'
         '265512fbfc65f89eab1ca23d11ec749d'
         'f239bb4e7b885449d1f4067b209d89fd'
         '143278e9495821bd887cf84ce0f97af6'
         'd4b89b7ff8ffb187d44fedf294e7f5de'
         'fcd93e2825c7f15355402c9d3569330d'
         '8c867371c83ce5848ed841e88be4998a'
         'e68e6460f5a2999635254dac64056679')

build() {
	cd "$srcdir"/$pkgname-$pkgver

  # fix logging binary data to journal/syslog when ipv4 disconnects with debug=1
  patch -Np1 < "$srcdir"/syslog.patch

	./configure \
    --prefix=/usr \
    --sysconfdir=/etc/nrpe \
		--with-nrpe-user=nrpe \
    --with-nrpe-group=nrpe \
		--enable-command-args
  
	make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

  # install and fix sample config file
  install -D -m644 "$srcdir"/nrpe.cfg "$pkgdir"/etc/nrpe/nrpe.cfg

  # fix paths to monitoring-plugins
  sed -e 's|/usr/libexec/|/usr/share/nagios/libexec/|g' \
      -i "$pkgdir"/etc/nrpe/nrpe.cfg

  install -dm755 "$pkgdir"/etc/nrpe/conf.d/
cat > "$pkgdir"/etc/nrpe/conf.d/process_checks.cfg <<EOT
command[check_zombie_procs]=/usr/share/nagios/libexec/check_procs -w 5 -c 10 -s Z
command[check_total_procs]=/usr/share/nagios/libexec/check_procs -w 150 -c 200
EOT

  # install main application
  install -D -m755 src/nrpe "$pkgdir"/usr/bin/nrpe

  # install systemd "unit" files
  install -D -m644 "$srcdir"/nrpe.service \
    "$pkgdir"/usr/lib/systemd/system/nrpe.service
  install -D -m644 "$srcdir"/nrpe.socket \
    "$pkgdir"/usr/lib/systemd/system/nrpe.socket
  install -D -m644 "$srcdir"/nrpe@.service \
    "$pkgdir"/usr/lib/systemd/system/nrpe@.service
  install -D -m644 "$srcdir"/nrpe.tmpfiles \
    "$pkgdir"/usr/lib/tmpfiles.d/nrpe.conf

  # install xinetd template
  install -Dm644 "$srcdir"/nrpe.xinetd "$pkgdir"/etc/xinetd.d/nrpe
}
