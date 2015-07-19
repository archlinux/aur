# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdradmin-am
pkgver=3.6.10
pkgrel=5
pkgdesc="Web user interface for VDR"
url="http://andreas.vdr-developer.org/vdradmin-am"
arch=('any')
license=('GPL2')
depends=('perl-cgi' 'perl-http-date' 'perl-locale-gettext' 'perl-template-plugin-javascript' 'perl-template-toolkit' 'perl-uri' 'vdr')
optdepends=('perl-authen-sasl: Required for AutoTimer email notification'
            'perl-digest-hmac: Required for AutoTimer email notification and CRAM-MD5 authentication'
            'perl-io-socket-inet6: Required for IPv6 support'
            'perl-io-socket-ssl: Required for SSL support (https)')
makedepends=('perl-authen-sasl' 'perl-digest-hmac' 'perl-io-socket-inet6' 'perl-io-socket-ssl')
source=("http://andreas.vdr-developer.org/vdradmin-am/download/$pkgname-$pkgver.tar.bz2"
        'fix-install.sh.diff'
        'vdradmin-am.service')
md5sums=('467ff4a482be2a5331ad4224a1cb9d8e'
         'f898ed796cc823286c9897dd72999017'
         '8261c77e1f110bd89614d6c90647436e')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fix-install.sh.diff"
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -r lib/*
  export DESTDIR="$pkgdir"
  export ETCDIR='/var/lib/vdradmin'
  export LOGDIR='/var/log/vdradmin'
  export PIDFILE='/run/vdradmind.pid'
  export VIDEODIR='/srv/vdr/video'
  export EPGIMAGES='/var/cache/vdr/epgimages'
  export VDRCONF='/var/lib/vdr'
  ./install.sh

  mkdir -p "$pkgdir/etc/vdradmin"

  install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  rm -r "$pkgdir/etc"
  rm -r "$pkgdir/usr/share/doc"

  mkdir -p "$pkgdir/var/cache/vdradmin"
  chown -R 666:666 "$pkgdir/var/cache/vdradmin"

  mkdir -p "$pkgdir/var/lib/vdradmin"
  chown -R 666:666 "$pkgdir/var/lib/vdradmin"

  mkdir -p "$pkgdir/var/log/vdradmin"
  chown -R 666:666 "$pkgdir/var/log/vdradmin"
}
