# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Anthony C <kurodroid.1@gmail.com>

pkgname=psad
pkgver=2.4.5
pkgrel=3
pkgdesc='A collection of three lightweight system daemons (two main daemons and one helper daemon) that run on Linux machines and analyze iptables log messages to detect port scans and other suspicious traffic'
arch=('i686' 'x86_64')
url='http://cipherdyne.org/psad/'
license=('GPL')
depends=('perl-bit-vector'
         'perl-date-calc' 
         'perl-iptables-chainmgr' 
         'perl-iptables-parse' 
         'perl-net-ipv4addr' 
         'perl-storable' 
         'perl-unix-syslog' 
         'net-tools')

source=("http://cipherdyne.org/psad/download/${pkgname}-${pkgver}.tar.gz"
        'responses'
        'psad-systemdinit.archlinux'
        'psad.patch')
sha256sums=('c61bd5c7766798dbaf2cd5e11d4b07b941e8188be4e0176423fe7bcabc676147'
            '0092963c506769f0bc1895ede687975dae0c3d256aaa1891f7e354b7c4a19958'
            '9db280ba745205b188333267f05cf7cf1a75300789c92c48075625e64f37ff34'
            '9137ea481f1cad79d62d3a7cf1ac22bbc85cccc7e18d49e1c092b38beec36170')
prepare() {
  cd "${pkgname}-${pkgver}"
  if [ ! -e responses ]; then
    ln "${srcdir}/responses" responses -s;
  fi

  #Set the config dirs
  #'/usr/sbin' and '/var/run' are just symlinks and makepkg -i doesn't like that.
  #Just sed '/usr/sbin' to '/usr/bin' and '/var/run' to 'run'
  #Also, '/lib' should really be '/usr/lib'
  sed -e "s|'/usr/sbin'|'$pkgdir/usr/bin'|" \
      -e "s|'/usr/bin'|'$pkgdir/usr/bin'|" \
      -e "s|'/var/run'|'$pkgdir/run'|" \
      -e "s|'/lib/systemd/system'|'$pkgdir/usr/lib/systemd/system'|" \
      -e "s|my \$mpath = \"/usr/share/man/man\$section\";|my \$mpath = \"$pkgdir/usr/share/man/man\$section\";|" \
          ./install.pl -i

  #Same cure applies to config file
  sed -e "s|/var/log/psad|$pkgdir&|" \
      -e "s|/var/run|/run|" \
      -e "s|/run/psad|$pkgdir&|" \
      -e "s|/var/lib/psad|$pkgdir&|" \
      -e "s|/usr/lib/psad|$pkgdir&|" \
      -e "s|/etc/psad|$pkgdir&|" \
      -e "s|/usr/bin/whois_psad|$pkgdir&|" \
      -e "s|/usr/sbin|/usr/bin|" \
      -e "s|/usr/bin/fwcheck_psad|$pkgdir&|" \
      -e "s|/usr/bin/psadwatchd|$pkgdir&|" \
      -e "s|/usr/bin/kmsgsd|$pkgdir&|" \
      -e "s|/usr/bin/psad|$pkgdir&|" \
         ./psad.conf -i
}

package () {
  cd "${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/etc/psad" \
           "$pkgdir/etc/rc.d" \
           "$pkgdir/usr/bin/" \
           "$pkgdir/usr/share/man/man8" \
           "$pkgdir/var/lib/psad" \
           "$pkgdir/var/log/psad" \
           "$pkgdir/usr/lib/psad" \
           "$pkgdir/usr/lib/systemd/system"

  ./install.pl --init-dir="$pkgdir" < responses

  #Set correct permissions
  chmod -R o+r "$pkgdir/etc/psad"
  chmod 0755 "$pkgdir/usr/bin/"*
  chmod 0700 "$pkgdir/var/lib/psad"
  chmod 0755 "$pkgdir/run"

  #add the systemd service file in '/usr/lib'
  cp "$srcdir/psad-systemdinit.archlinux" "$pkgdir/usr/lib/systemd/system/psad.service"

  # Fix the config
  sed -e "s|$pkgdir||g" "$pkgdir/etc/psad/psad.conf" -i
  sed -e "s|$pkgdir||g" "$pkgdir/var/log/psad/install.log" -i
}
# vim:set ts=2 sw=2 et: