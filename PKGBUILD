# Maintainer: vmalloc vmalloc@cyborg-connect.de
# Contributor: Yejun Yang  yejunx AT gmail DOT com
# The PKGBUILD and install files are based upon those created by Yejun
# This version contains an important bugfix regarding failures on DNSSEC-enabled queries on unsigned domains where the 
# response should have been NXDOMAIN, NODATA or a wildcard response. 
# Jan 16, 2015
pkgname=djbdns-djb
pkgver=1.05
pkgrel=00
pkgdesc="djbdns is a DNS package by DJ Bernstein including tinydnssec"
arch=('i686' 'x86_64')
url="http://cr.yp.to/djbdns.html"
license=('Public domain')
depends=('daemontools' 'ucspi-tcp')
makedepends=('wget' 'gawk')
install=djbdns.install
source=("http://cr.yp.to/djbdns/djbdns-$pkgver.tar.gz"
'http://www.fefe.de/dns/djbdns-1.05-test25.diff.bz2'
	'http://www.fefe.de/dns/djbdns-1.05-ixfr.diff.gz'
	'http://smarden.org/pape/djb/manpages/djbdns-1.05-man.tar.gz'
	'http://www.internic.net/domain/named.root'
	'http://www.tinydnssec.org/download/tinydnssec-1.05-1.3.tar.bz2'
	'ipv6intremove.patch'
	'axfred.patch'
	'nsd-xfr.patch')

sha512sums=('20f066402801d7bec183cb710a5bc51e41f1410024741e5803e26f68f2c13567e48eba793f233dfab903459c3335bc169e24b99d66a4c64e617e1f0779732fa9'
            '41cca597dba971010b9844071e0349d3a4b25cc4b144e12721b0bc8250589fb374e40ece8908f1081762597048179b1177e88b9a5f97be0b47b63e3183e654bb'
            '17ce9553b301482daa57c18317aa147c8f0e9e8e6b323c577c05b5edb625fa2f55143ff956443d78ab908d60cd9c78c0ffaa2aa446d52be0a18fbef75965790a'
            '98af7bd9033a2205fbbc0f23b7eab45b9756f6ceff5199a62952e19c89c9fe3c03495cb6f8621d388f883c40650309a1509095417df3f54af21a71350c4aa183'
            '3911564a7d82e4c9a9426725caeeaf7b6844eefe1bfaa14b88d4627280591cef3e72da2ce2e0641f9d9d40edaac2e405c7dd5eb1c15a513c4edc6aafa91dc117'
            'dab020db0234ad5fa82f7a4d150ec3755c482a0b7a21a8389eaf7ff74162cfa12869cc4b4215a55cfa9221cd422ac39bf5a6a8facce579a7997a107d5e0afe8a'
            '06038ec74879221375bf04c6f358a174da69574e5690a65aa04a57c7808c9e6fe520a296aae5ed999c7484139d1d8b85404403ba75fbb6691ffa2d4934ceff88'
            '625a4937d94d268389255e7369b356ac64657a987771714226ecc999ea8f065ac09d1522bf9b8ec464c726f1562bba306bf47ace6fe233fa15efcbcae10a28c2'
            '98d6226827957dda03200d3eef6fa467026a5eeef00a12d536cd836ca0243b853fd11615c8d24f0a28eef12c51079561269ae92d772574f2f59cb4e45dfc3757')


package() {
  cd "$srcdir/djbdns-$pkgver"
  echo gcc $CFLAGS -include /usr/include/errno.h > conf-cc
  echo /usr > conf-home
  patch -p1 < ../djbdns-1.05-test25.diff || return 1
  patch -p1 < ../ipv6intremove.patch || return 1
  patch -p0 < ../axfred.patch || return 1
  patch -p0 < ../nsd-xfr.patch || return 1
  patch -p1 < ../djbdns-1.05-dnssec.patch || return 1
  make || return 1
  mkdir -p ${pkgdir}/usr/bin ${pkgdir}/etc || return 1
  
  for f in dnscache-conf tinydns-conf walldns-conf rbldns-conf pickdns-conf \
           axfrdns-conf dnscache tinydns walldns rbldns pickdns axfrdns \
           tinydns-get tinydns-data tinydns-edit rbldns-data pickdns-data \
           axfr-get; do
      install -m755 $f ${pkgdir}/usr/bin/ || return 1
  done
    
  for f in dnsip dnsipq dnsname dnstxt dnsmx dnsfilter random-ip dnsqr dnsq dnstrace \
           dnstracesort; do
      install -m755 $f ${pkgdir}/usr/bin/ || return 1
  done
  cat $srcdir/named.root | awk --posix '/\.ROOT-SERVERS\.NET.*[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/ { print $4; }' > dnsroots.global || return 1
  install -m644 dnsroots.global ${pkgdir}/etc || return 1

  cd "$srcdir" || return 1
  install -m 755 -D tinydns-sign.pl "$pkgdir/usr/bin/tinydns-sign.pl"

  cd "$srcdir" || return 1
  install -m 755 -D run-tests.sh "$pkgdir/usr/bin/run-tests.sh"

  cd "$srcdir/djbdns-man" || return 1
  gzip *.1 *.5 *.8 || return 1
  mkdir -p ${pkgdir}/usr/share/man/man1 ${pkgdir}/usr/share/man/man5 ${pkgdir}/usr/share/man/man8 || return 1
  install -m644 *.1.gz ${pkgdir}/usr/share/man/man1
  install -m644 *.5.gz ${pkgdir}/usr/share/man/man5
  install -m644 *.8.gz ${pkgdir}/usr/share/man/man8
}
