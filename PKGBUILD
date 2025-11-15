# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdradmin-am
pkgver=3.6.15
pkgrel=1
pkgdesc="Web user interface for VDR"
url="https://github.com/vdr-projects/vdradmin-am"
arch=('any')
license=('GPL2')
depends=('perl-cgi' 'perl-http-date' 'perl-locale-gettext' 'perl-template-plugin-javascript' 'perl-template-toolkit' 'perl-uri' 'perl-http-daemon' 'vdr')
optdepends=('perl-authen-sasl: Required for AutoTimer email notification'
            'perl-digest-hmac: Required for AutoTimer email notification and CRAM-MD5 authentication'
            'perl-io-socket-inet6: Required for IPv6 support'
            'perl-http-daemon-ssl: Required for SSL support (https)')
makedepends=('perl-authen-sasl' 'perl-digest-hmac' 'perl-io-socket-inet6' 'perl-http-daemon-ssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/vdradmin-am/archive/refs/tags/v$pkgver.tar.gz"
        'vdradmin-am.service')
sha256sums=('777f461f7c1f6baaace0bef6aef8d005959261cf30320ea720a6d64c7bb98e50'
            '2a33bbdac1ba7c80139d17e5d7cca7ccbf2a2945aeaf0777d0dd6fbe594bfe54')

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
