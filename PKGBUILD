# Maintainer: Ruthger Gubbels <aur@ruthger.nl>

pkgname='communigatepro-av'
pkgver='1.5'
pkgrel='3'
pkgdesc='Spamassassin, ClamAV and DMARC scripts for Communigate Pro Communications platform'
arch=(x86_64)
url='http://www.stalker.com/'
license=('GPL')
depends=('spamassassin' 'clamav' 'communigatepro' 'perl-email-address' 'perl-archive-zip')
install='install'
source=(
  'http://program.farit.ru/antivir/cgpav-1.5.tar.gz'
  'cgpav-spamassassin.service'
  'DMARC.pl'
)
backup=('var/lib/CommuniGate/Settings/cgpav.conf' 'var/lib/Communigate/Helpers/DMARC.pl')
sha512sums=('dfeeb28c3238d11b45d48ae3684db1867b9b4ba2fdcc752d0172a4767d6329fd146a267f0ae25d574ff161f44f6d6b562e9651b7346a78ad8b6d9929d6e0791b'
            'c2dc2c03d77df762cf791f597685588b7d3d221a179ccaebbc4608b0230296603c9c851143f48bda928db74e0c5d193b1eb5732a5eef66dbb9b9e497fd265d2e'
            'a233b7f575a7f76a0f0f61172f9c1e294d5f698e8f3726fdecd9d3b12f068d1e967b897dcafd08986f79a62bfaad7d7ba15d0323692806920223ebc148139577')

build() {
  cd cgpav-"$pkgver"
  ./configure --with-antivirus=clamav --with-spamassassin=yes --with-mysql=no --with-pgsql=no
  make

  sed -i 's/\/var\/CommuniGate/\/var\/lib\/CommuniGate/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/log_facility \= local0/log_facility \= \/var\/log\/cgpav.log/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/clamd_socket \= \/tmp\/clamd/clamd_socket \=  \/var\/lib\/clamav\/clamd.sock/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/avpctl_filename/#avpctl_filename/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/sophos_socket/#sophos_socket/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/trophie_socket/#trophie_socket/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/drwebd_socket/#drwebd_socket/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/enable_spamassassin \= false/enable_spamassassin \= true/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
  sed -i 's/spamassassin_socket \= \/var\/run\/spam/spamassassin_socket \= \/var\/run\/spamd.ctl/' "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf
}

package() {
  # Systemd service
  install -Dm644 cgpav-spamassassin.service "$pkgdir"/usr/lib/systemd/system/cgpav-spamassassin.service
 
  install -dm755 "$pkgdir"/var/lib/CommuniGate/Helpers "$pkgdir"/var/lib/CommuniGate/Helpers
  install -Dm755 "$srcdir"/cgpav-"$pkgver"/cgpav "$pkgdir"/var/lib/CommuniGate/Helpers/cgpav
  install -Dm755 DMARC.pl "$pkgdir"/var/lib/CommuniGate/Helpers/DMARC.pl
  install -dm755 "$pkgdir"/var/lib/CommuniGate/Helpers "$pkgdir"/var/lib/CommuniGate/Settings
  install -Dm644 "$srcdir"/cgpav-"$pkgver"/conf/cgpav.conf "$pkgdir"/var/lib/CommuniGate/Settings/cgpav.conf
}
