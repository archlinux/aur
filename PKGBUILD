# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Sébastien Luttringer
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
# Contributor: Mario Vazquez <mario_vazq@hotmail.com>

pkgname=bind-rl
_pkgname=bind
_pkgver=9.10.1-P1
pkgver=9.10.1.P1
pkgrel=1
pkgdesc='The ISC BIND nameserver with Response Rate Limiting(RRL) enabled.'
url='http://www.isc.org/software/bind/'
license=('custom:ISC')
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('openssl' 'krb5' 'libxml2' 'libcap')
conflicts=('bind')
provides=('dns-server')
backup=('etc/named.conf'
        'var/named/127.0.0.zone'
        'var/named/localhost.zone'
        'var/named/localhost.ip6.zone'
        'var/named/empty.zone')
install=$_pkgname.install
source=("http://ftp.isc.org/isc/bind9/${_pkgver}/bind-${_pkgver}.tar.gz"{,.asc}
        'tmpfiles.conf'
        'sysusers.conf'
        'named.conf'
        'named.service'
        'localhost.zone'
        'localhost.ip6.zone'
        '127.0.0.zone'
        'empty.zone')
sha1sums=('24a81ba458a762c27be47461301fcf336cfb1d43'
          'SKIP'
          'c5a2bcd9b0f009ae71f3a03fbdbe012196962a11'
          '6bebf4ff8ca4482a83f4d3dbf176d9bffd89eefa'
          'c017aae379c32c7cb1aa1ad84776b83e3a5c139f'
          'cb2e81b4cbf9efafb3e81e3752f0154e779cc7ec'
          '6704303a6ed431a29b1d8fe7b12decd4d1f2f50f'
          '52da8f1c0247a11b16daa4e03d920e8f09315cbe'
          '9c33726088342207ad06d33b2c13408290a0c8ad'
          '4f4457b310cbbeadca2272eced062a9c2b2b42fe')

prepare() {
  # remove dig to avoid conflict with dnsutils
  sed -i 's/dig//' $_pkgname-$_pkgver/bin/Makefile.in

  msg2 'Getting a fresh version of root DNS'
  # no more using source array, lack of versioning.
  curl -o root.hint http://www.internic.net/zones/named.root
  [[ -s root.hint ]]
}

build() {
  cd bind-$_pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-static \
    --with-openssl \
    --with-libxml2 \
    --with-libtool \
    --enable-rrl
  make
}

package() {
  pushd "bind-$_pkgver"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  make DESTDIR="$pkgdir" install
  popd

  install -D -m644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -D -m644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"

  install -D -m644 named.service "$pkgdir/usr/lib/systemd/system/named.service"
  install -D -m640 -o 0 -g 40 named.conf "$pkgdir/etc/named.conf"

  install -d -m770 -o 0 -g 40 "$pkgdir/var/named"
  install    -m640 -o 0 -g 40 root.hint "$pkgdir/var/named"
  install    -m640 -o 0 -g 40 localhost.zone "$pkgdir/var/named"
  install    -m640 -o 0 -g 40 localhost.ip6.zone "$pkgdir/var/named"
  install    -m640 -o 0 -g 40 127.0.0.zone "$pkgdir/var/named"
  install    -m640 -o 0 -g 40 empty.zone "$pkgdir/var/named"
}

