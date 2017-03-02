# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=lldpd-git
_pkgname=lldpd
pkgver=0.9.6.12
pkgrel=1
pkgdesc='802.1ab implementation (LLDP) to help you locate neighbors'
arch=('i686' 'x86_64')
url='http://vincentbernat.github.io/lldpd/'
license=('custom:ISC' 'GPL')
depends=('glibc' 'libevent' 'libbsd' 'zlib' 'openssl' 'pciutils' 'perl'
         'libxml2' 'net-snmp' 'jansson')
makedepends=('git')
provides=('lldpd')
conflicts=('lldpd')
backup=('etc/lldpd.conf')
install=$_pkgname.install
source=("$pkgname::git+https://github.com/vincentbernat/lldpd.git"
        'LICENSE'
        'lldpd.service'
        'lldpd.sysusers'
        'lldpd.tmpfiles')
md5sums=('SKIP'
         '8ae98663bac55afe5d989919d296f28a'
         'a650af7390db0632480184f9f2e7ee4a'
         '8623610442a9d553de764b50046cd6d3'
         '00a82f466404aec01b074503633d12ba')

pkgver() {
  cd $pkgname
  git describe --tags --always | sed 's|-|.|g;s|[.]g[a-f0-9]*$||'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --with-snmp \
    --with-xml \
    --with-json \
    --with-readline \
    --with-privsep-user=lldpd \
    --with-privsep-group=lldpd \
    --with-privsep-chroot=/run/lldpd/chroot \
    --with-lldpd-ctl-socket=/run/lldpd/socket \
    --with-lldpd-pid-file=/run/lldpd/pid
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  # config stuff
  install -D -m 644 /dev/null "$pkgdir/etc/lldpd.conf"
  install -d -m 755  "$pkgdir/etc/lldpd.d"
  # systemd stuff
  install -D -m 644 lldpd.service "$pkgdir/usr/lib/systemd/system/lldpd.service"
  install -D -m 644 lldpd.sysusers "$pkgdir/usr/lib/sysusers.d/lldpd.conf"
  install -D -m 644 lldpd.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/lldpd.conf"
  # license
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd $pkgname
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
