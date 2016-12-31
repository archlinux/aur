# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=ntpsec
pkgver=0.9.6
pkgrel=1
pkgdesc="Security-hardened Network Time Protocol implementation"
arch=('i686' 'x86_64')
url="https://www.ntpsec.org/"
license=('custom')
depends=('avahi' 'libevent' 'libseccomp' 'python')
makedepends=('asciidoc' 'pps-tools' 'w3m')
optdepends=('gnuplot: for ntpviz'
            'libevent: for ntpdig'
            'python-psutil: Optional for ntpviz, allows running with ionice'
            'ttf-liberation: Improves font quality in ntpviz renderings')
provides=('ntp')
conflicts=('ntp')
source=("ftp://ftp.ntpsec.org/pub/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('9d15ac59b67911eb1b42fe5916e8d00ded8b71ba34f1ab4fc0f251fc0d90d5e5')
validpgpkeys=('DA3FDF774CC70FA64729EC4505D9B371477C7528')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  sed -i -e 's/sbin/bin/g' "etc/ntpd.service"
}

build() {
  cd "$pkgname-$pkgver"
  ./waf configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib \
        --enable-debug-gdb --enable-seccomp --refclock=all \
        --sbindir=/usr/bin --enable-doc --htmldir=/usr/share/doc/"$pkgname"
  ./waf build
  a2x -f text docs/copyright.txt
}

check() {
  cd "$pkgname-$pkgver"
  ./waf check
}

package() {
  cd "$pkgname-$pkgver"
  ./waf install --destdir="$pkgdir/"

  install -d "$pkgdir/etc/logrotate.d"
  install -d "$pkgdir/usr/lib/systemd/system"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 etc/logrotate-config.ntpd "$pkgdir/etc/logrotate.d/ntpd"
  install -m 644 etc/ntpd.service "$pkgdir/usr/lib/systemd/system/ntpd.service"
  install -m 644 docs/copyright.text "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # --mandir, it does nothing!
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
}
