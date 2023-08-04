# Maintainer: Gregory Boyce <gregory@auburndaletech.com>

pkgname=ntpsec
pkgver=1.2.2a
pkgrel=1
pkgdesc="Security-hardened Network Time Protocol implementation"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.ntpsec.org/"
license=('custom')
depends=('avahi' 'libbsd' 'python' 'openssl')
makedepends=('asciidoc' 'pps-tools' 'w3m' 'binutils')
optdepends=('gnuplot: for ntpviz'
            'libevent: for ntpdig'
            'python-psutil: Optional for ntpviz, allows running with ionice'
            'ttf-liberation: Improves font quality in ntpviz renderings')
provides=('ntp')
conflicts=('ntp')
source=("ftp://ftp.ntpsec.org/pub/releases/$pkgname-$pkgver.tar.gz"
        "ftp://ftp.ntpsec.org/pub/releases/$pkgname-$pkgver.tar.gz.asc"
        use-arch-pool.patch
        ntpsec.sysusers)
sha512sums=('7a2cc04bde49800a745c74933e565a4764a22be484faffc5ea933231b74507af737a691cd0bb3aa024e81c083be0718c8d7b30dd152b0b0d386ae72fda426db9'
            'c1b0c1c6b534b11ef172d5ab68ada47bbd9e3f0298400c684e8745447221db16e4f4de436f06b0f6ab374e437b0506853a3a3da2bbe17c148cdf7de62c769f28'
            '7edb1d2dd41b135fa489de1802ea9b4079e9cb6556fa6457924bf7363bef7375987b9e4bb6507730ad906199ba55a44103d0655ad1f517b0426083be5b3e218c'
            'ac4ce13fe88a383382abb92cb34ab231467cbc9dcb8ac8780480d467f295ddf65e217b6415bbadabd8c7ac9832b0fd9058b837946aa2d5dcfd9f3bb81cff6b31')
validpgpkeys=('E57235D22764129FA4F2F4D17F52608ED0E49D76')
backup=('etc/ntp.conf'
        'etc/ntp.d/default.conf'
        'etc/ntp.d/use-pool')

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

  ./waf configure --prefix /usr --sbindir=/usr/bin --enable-debug-gdb \
        --refclock=all --enable-doc --htmldir=/usr/share/doc/ntpsec \
        --enable-leap-smear
  ./waf build

  a2x -f text docs/copyright.adoc
}

check() {
  cd "$pkgname-$pkgver"

  ./waf check
}

package() {
  cd "$pkgname-$pkgver"

  ./waf install --destdir="$pkgdir/"

  install -Dm 644 etc/logrotate-config.ntpd "$pkgdir/etc/logrotate.d/ntpd"
  install -Dm 644 build/main/etc/ntpd.service "$pkgdir/usr/lib/systemd/system/ntpd.service"
  install -Dm 644 docs/copyright.text "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm 644 ../ntpsec.sysusers "$pkgdir/usr/lib/sysusers.d/ntpsec.conf"

  for configfile in etc/ntp.d/*; do
     install -Dm 644 "$configfile" "$pkgdir/$configfile"
  done

  install -dm 700 -g 212 -o 212 "$pkgdir/var/lib/ntp"
  touch $pkgdir/etc/ntp.conf

}
