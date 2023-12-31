# Maintainer: Gregory Boyce <gregory@auburndaletech.com>

pkgname=ntpsec
pkgver=1.2.3
pkgrel=2
pkgdesc="Security-hardened Network Time Protocol implementation"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.ntpsec.org/"
license=('Apache-2.0','BSD-2-Clause','BSD-4-Clause','ISC','NTP','Beerware','BSD-3-Clause','CC-BY-4.0','MIT')
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
sha512sums=('6baecf32f499fc12c2ef0b44360072b61ab9e8b52ec7ead64ff43a27b5a57431db939d4ce1fad92d38def981f6256a1d8ede0c0cdc5abb50d861be729255eee2'
            '17280e3092e7e9de0ddae0723637a261d3a740d916ce0f016c44c6010672cfe2fc39b45f86257cfa5bd29f1f11895f8bd583c76765c6484489027cbc82dbe6b2'
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

  ./waf configure --prefix /usr --sbindir=/usr/bin --refclock=all --enable-leap-smear\
  --enable-doc --htmldir=/usr/share/doc/ntpsec
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
  install -Dm 644 LICENSES/*.txt "$pkgdir/usr/share/licenses/$pkgname/"

  for configfile in etc/ntp.d/*; do
     install -Dm 644 "$configfile" "$pkgdir/$configfile"
  done

  install -dm 700 -g 212 -o 212 "$pkgdir/var/lib/ntp"
  touch $pkgdir/etc/ntp.conf

}
