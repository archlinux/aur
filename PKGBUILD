# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Anthony C <kurodroid.1@gmail.com>

pkgname=psad
pkgver=2.4.3
pkgrel=1
pkgdesc="A collection of three lightweight system daemons (two main daemons and one helper daemon) that run on Linux machines and analyze iptables log messages to detect port scans and other suspicious traffic"
arch=(i686 x86_64)
url="http://cipherdyne.org/psad/"
license=('GPL')
depends=('perl-bit-vector' 'perl-date-calc' 'perl-iptables-chainmgr' 'perl-iptables-parse' 'perl-net-ipv4addr' 'perl-storable' 'perl-unix-syslog' 'net-tools')
source=("http://cipherdyne.org/psad/download/${pkgname}-${pkgver}.tar.gz"
        "responses"
        "psad-systemdinit.archlinux"
        "psad.patch")
md5sums=('5aa0d22f0bea3ba32e3b9730f78157cf'
         '2425986f9eaa44d983128ebea6c8baf4'
         '29324f5fb0ccf69b443710c7d4c075fd'
         '686dee1b3ebff03acde910fa443cbfc6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  if [ ! -e responses ]; then
    ln $srcdir/responses responses -s;
  fi

  patch -p1 -i "${srcdir}/psad.patch"

  #Set the config dirs
  sed -e "s|'/usr/sbin'|'$pkgdir/usr/sbin'|" \
      -e "s|'/usr/bin'|'$pkgdir/usr/bin'|" \
      -e "s|my \$mpath = \"/usr/share/man/man\$section\";|my \$mpath = \"$pkgdir/usr/share/man/man\$section\";|" \
          ./install.pl -i
  sed -e "s|/var/log/psad|$pkgdir&|" \
      -e "s|/var/run/psad|$pkgdir&|" \
      -e "s|/var/lib/psad|$pkgdir&|" \
      -e "s|/usr/lib/psad|$pkgdir&|" \
      -e "s|/etc/psad|$pkgdir&|" \
      -e "s|/usr/bin/whois_psad|$pkgdir&|" \
      -e "s|/usr/sbin/fwcheck_psad|$pkgdir&|" \
      -e "s|/usr/sbin/psadwatchd|$pkgdir&|" \
      -e "s|/usr/sbin/kmsgsd|$pkgdir&|" \
      -e "s|/usr/sbin/psad|$pkgdir&|" \
        ./psad.conf -i


}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  #hope that things work
  mkdir -p $pkgdir/etc/psad \
           $pkgdir/etc/rc.d \
           $pkgdir/usr/bin \
           $pkgdir/usr/sbin \
           $pkgdir/usr/share/man/man8 \
           $pkgdir/var/lib/psad \
           $pkgdir/var/log/psad \
           $pkgdir/var/run/psad \
           $pkgdir/usr/lib/psad \
           $pkgdir/usr/lib/systemd/system
  ./install.pl --init-dir "$pkgdir/etc/rc.d/" < responses

  #Set correct permissions
  chmod -R o+r $pkgdir/etc/psad
  chmod -R o+r $pkgdir/usr/sbin/*
  chmod 0700 $pkgdir/var/lib/psad

  #add the systemd service file
  cp $srcdir/psad-systemdinit.archlinux $pkgdir/usr/lib/systemd/system/psad.service

  # Fix the config
  sed -e "s|$pkgdir||" $pkgdir/etc/psad/psad.conf -i
  sed -e "s|$pkgdir||" $pkgdir/var/log/psad/install.log -i
}

# vim:set ts=2 sw=2 et:
