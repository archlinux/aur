# Maintainer: GI Jack <GI_Jack@hackermail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Anthony C <kurodroid.1@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=psad
pkgver=2.4.6
pkgrel=3
pkgdesc='Port Scan Attack Detector: Makes use of iptables log messages to detect, alert, and (optionally) block port scans and other suspect traffic'
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
         'net-tools'
         's-nail')
optdepends=('smtp-server: For Sending Email alerts')
source=("https://github.com/mrash/psad/archive/refs/tags/${pkgver}.tar.gz"
        'responses'
        'psadwatchd.service'
        'kmsgsd.service'
        'psad.patch')
sha256sums=('2001f6f6d8eaa50e74c3a8c346d885e9578f15578b54669ef56c2d301d8b45d4'
            '0f1116e25f43f1562764d81ebd232ed807f2249058f0cfb0cb4d06d99bd600d8'
            '426b9e1ff9fd3b9f802b418790d54881087d7b92f4ddb4026ba70fbabb5c9da2'
            '0cda106fa0add325c8b91fbb9d6dca5bda825c7a589d4d3b6c757342b606af96'
            '6155bd90a071a27f04dfb515a495def85507c0d1671df8fa1ba10dce58540bd6')
prepare() {
  cd "${pkgname}-${pkgver}"
  make clean
  if [ ! -e responses ]; then
    ln "${srcdir}/responses" responses -s;
  fi
  # because people who write Perl don't care about how things are done in
  # the 21st century
  patch -N -p1 < "${srcdir}/psad.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make all
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

  ./install.pl  --runlevel 3 --install-root="${pkgdir}" --systemd-init-dir="${pkgdir}/usr/lib/systemd/system" < responses

  #Set correct permissions
  chmod -R o+r "$pkgdir/etc/psad"
  chmod 0755 "$pkgdir/usr/bin/"*
  chmod 0700 "$pkgdir/var/lib/psad"
  chmod 0755 "$pkgdir/run"

  #add the systemd service file in '/usr/lib'
  cp "$srcdir/psadwatchd.service" "$pkgdir/usr/lib/systemd/system/psadwatchd.service"
  cp "$srcdir/kmsgsd.service" "$pkgdir/usr/lib/systemd/system/kmsgsd.service"
  
  # Logrotate file
  install -Dm 644 misc/logrotate.psad "${pkgdir}/etc/logrotate.d/psad"
  
  # misc crap
  for file in misc/*.pl;do
    install -Dm444 ${file} "${pkgdir}/usr/lib/psad/${file}"
  done
  
  # pscan.
  install -Dm 644 misc/pscan "${pkgdir}/usr/bin/pscan"
  
  # Fix systemd unit
  # Fix the config
  sed -e "s|/usr/sbin|/usr/bin|g" "$pkgdir/usr/lib/systemd/system/psad.service" -i
  sed -e "s|/var/run|/run|g" "$pkgdir/usr/lib/systemd/system/psad.service" -i
  sed -e "s|$pkgdir|/|g" "$pkgdir/etc/psad/psad.conf" -i
  sed -e "s|$pkgdir||g" "$pkgdir/var/log/psad/install.log" -i
}
# vim:set ts=2 sw=2 et:
