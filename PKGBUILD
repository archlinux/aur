# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=ntpsec
pkgver=0.9.5
pkgrel=3
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
source=("ftp://ftp.ntpsec.org/pub/releases/ntpsec-$pkgver.tar.gz"
        "ftp://ftp.ntpsec.org/pub/releases/ntpsec-$pkgver.tar.gz.sig"
        "autorevision-cache"
        "0001-Python-3-portability-fix-for-waf-build.patch")
sha256sums=('4ddfb2c500428b14c272d6ad600438dec6ca76f87b0b20015dddfe7a18e5b7e3'
            'SKIP'
            '1c6d50ba5404ac0573b93fc12101be1028c3ea5740318576a8bf6479abda27dc'
            'ad2ccebec3877832cc75802a39cec14dd8cc3fdde86ee9f59edb2e3e93ae19eb')
noextract=("ntpsec-$pkgver.tar.gz")
validpgpkeys=('DA3FDF774CC70FA64729EC4505D9B371477C7528')

prepare() {
  mkdir "ntpsec-$pkgver"
  tar -xf ntpsec-$pkgver.tar.gz -C "ntpsec-$pkgver"
  cd "ntpsec-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  sed -i -e 's/sbin/bin/g' "etc/ntpd.service"
  sed -i -e '/ExecStop/d' "etc/ntpd.service"
}

build() {
  cd "$pkgname-$pkgver"
  mkdir -p "build/main/wafhelpers"
  cp "$srcdir/autorevision-cache" "build/main/wafhelpers/.autorevision-cache"
  ./waf configure --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib \
        --enable-debug-gdb --enable-seccomp --refclock=all \
        --sbindir=/usr/bin --enable-doc --path-doc=/usr/share/doc/ntpsec
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
  install -d "$pkgdir/usr/share/licenses/ntpsec"
  install -m 644 etc/logrotate-config.ntpd "$pkgdir/etc/logrotate.d/ntpd"
  install -m 644 etc/ntpd.service "$pkgdir/usr/lib/systemd/system/ntpd.service"
  install -m 644 docs/copyright.text "$pkgdir/usr/share/licenses/ntpsec/COPYING"

  # --mandir, it does nothing!
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
}
