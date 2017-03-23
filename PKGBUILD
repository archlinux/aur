# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=ntpsec
pkgver=0.9.7
pkgrel=1
pkgdesc="Security-hardened Network Time Protocol implementation"
arch=('i686' 'x86_64')
url="https://www.ntpsec.org/"
license=('custom')
depends=('avahi' 'libseccomp' 'python')
makedepends=('asciidoc' 'pps-tools' 'w3m')
optdepends=('gnuplot: for ntpviz'
            'libevent: for ntpdig'
            'python-psutil: Optional for ntpviz, allows running with ionice'
            'ttf-liberation: Improves font quality in ntpviz renderings')
provides=('ntp')
conflicts=('ntp')
source=("ftp://ftp.ntpsec.org/pub/releases/$pkgname-$pkgver.tar.gz"
        "ftp://ftp.ntpsec.org/pub/releases/$pkgname-$pkgver.tar.gz.asc")
sha512sums=('48a66be0e77ec1b134a0f9b1c5be4e79160ce99219e903ea1c3856969ede6f5abf00d70c627e209631cc223f2e4fdb31e89c9497d2fa3ab44ae0ab1beed0c413'
            'SKIP')
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
}

build() {
  cd "$pkgname-$pkgver"
  ./waf configure --prefix=/usr --sbindir=/usr/bin \
        --enable-debug-gdb --enable-seccomp --refclock=all \
        --enable-doc --htmldir=/usr/share/doc/${pkgname}
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

  install -Dm 644 etc/logrotate-config.ntpd "$pkgdir/etc/logrotate.d/ntpd"
  install -Dm 644 etc/ntpd.service "$pkgdir/usr/lib/systemd/system/ntpd.service"
  install -Dm 644 docs/copyright.text "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # --mandir, it does nothing!
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
}
