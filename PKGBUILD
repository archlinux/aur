# Orginal Maintainer: Arthur Țițeică arthur.titeica/gmail/com
# Current Maintainer: Hao Zhang <theivorytower [at] gmail [dot] com>

pkgname=opendmarc
pkgver=1.3.1
pkgrel=2
pkgdesc="Free open source software implementation of the DMARC specification"
arch=('i686' 'x86_64')
url="http://www.trusteddomain.org/opendmarc/"
license=('custom')
depends=('smtp-server')
makedepends=('libmilter')
optdepends=('opendbx: acts as a middleware layer between OpenDMARC and a SQL backend of choice'
            'python: run opendmarc scripts at /usr/share/doc/opendmarc'
            'perl: run opendmarc scripts at /usr/share/doc/opendmarc'
            'perl-switch: generate DMARC reports'
            'perl-dbd-mysql: generate DMARC reports'
            'perl-libwww: generate DMARC reports')
install=$pkgname.install
backup=(etc/opendmarc/opendmarc.conf)
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz
        opendmarc.service)

sha256sums=('a0c0cf74de68454cbdce16a3095b96e70fc16614325052ea230878d1ca64da6b'
            'dc16a2bb66df7473a0288fc0c33db731922ff2ea9fdcd59d86da8dc908ca4a14')

build() {
  export LDFLAGS="${LDFLAGS//,--as-needed}" 
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --sysconfdir=/etc/$pkgname

  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # sample config
  install -D -m644 "$srcdir"/$pkgname-$pkgver/$pkgname/opendmarc.conf.sample "$pkgdir"/etc/$pkgname/opendmarc.conf.sample
  # License
  install -D -m644 "$srcdir"/$pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm "$pkgdir"/usr/share/doc/$pkgname/LICENSE
  # systemd service
  install -D -m644 "$srcdir/$pkgname.service" "${pkgdir}/usr/lib/systemd/system/$pkgname.service"

}

# vim:set ts=2 sw=2 et:
