# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdradmin-am
pkgver=3.6.13
pkgrel=1
pkgdesc="Web user interface for VDR"
url="https://github.com/vdr-projects/vdradmin-am"
arch=('any')
license=('GPL2')
depends=('perl-cgi' 'perl-http-date' 'perl-locale-gettext' 'perl-template-plugin-javascript' 'perl-template-toolkit' 'perl-uri' 'perl-http-daemon' 'perl-http-daemon-ssl' 'vdr')
optdepends=('perl-authen-sasl: Required for AutoTimer email notification'
            'perl-digest-hmac: Required for AutoTimer email notification and CRAM-MD5 authentication'
            'perl-io-socket-inet6: Required for IPv6 support'
            'perl-io-socket-ssl: Required for SSL support (https)')
makedepends=('perl-authen-sasl' 'perl-digest-hmac' 'perl-io-socket-inet6' 'perl-io-socket-ssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdradmin-am/archive/refs/tags/v$pkgver.tar.gz"
        'fix-install.sh.diff'
        'vdradmin-am.service')
sha256sums=('eda3bdd947b27fc2ff73df3e68ba12aeb80cb2c5aecc63f30815eb68187c9e3e'
            '06d731235c03d94b5b6bb872e7be92bad587642e26eec38dd78daf0256602141'
            '2a33bbdac1ba7c80139d17e5d7cca7ccbf2a2945aeaf0777d0dd6fbe594bfe54')

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
