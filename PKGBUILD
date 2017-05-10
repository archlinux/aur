# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Arthur Țițeică arthur.titeica/gmail/com
# Contributor: Hao Zhang <theivorytower [at] gmail [dot] com>

pkgname=opendmarc-libspf2
_pkgbase="${pkgname%-libspf2}"
pkgver=1.3.2
pkgrel=1
pkgdesc="OpenDMARC libspf2 version (make internal SPF checks actually usable)"
arch=('i686' 'x86_64')
url="http://www.trusteddomain.org/opendmarc/"
license=('custom')
conflicts=('opendmarc')
provides=("opendmarc=$pkgver")
depends=('smtp-server' 'libspf2' 'libbsd' 'libidn')
makedepends=('libmilter')
optdepends=('opendbx: acts as a middleware layer between OpenDMARC and a SQL backend of choice'
            'python: run opendmarc scripts at /usr/share/doc/opendmarc'
            'perl: run opendmarc scripts at /usr/share/doc/opendmarc'
            'perl-switch: generate DMARC reports'
            'perl-dbd-mysql: generate DMARC reports'
            'perl-libwww: generate DMARC reports')
install=${_pkgbase}.install
# unfortunately the gpg key (2D55C45B89CFFD42), that is used for signing, is not public
source=("https://downloads.sourceforge.net/project/${_pkgbase}/${_pkgbase}-$pkgver.tar.gz"  #{,.asc}
        opendmarc.service)
sha512sums=('6045fb7d2be8f0ffdeca07324857d92908a41c6792749017c2fcc1058f05f55317b1919c67c780827dd7094ec8fff2e1fa4aeb5bab7ff7461537957af2652748'
            '68078748a307479b72a7a0906534945e8613692d34e640bc7fefb55b36649f1461ec606808dc6dfb95028c5520a6232bb9ab79481d15520033fa3c3911d3e52f')

build() {
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  cd "$srcdir/${_pkgbase}-$pkgver"
  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --sysconfdir=/etc/${_pkgbase} \
              --with-spf \
              --with-spf2-include=/usr/include/spf2 \
              --with-spf2-lib=/usr/lib/
  make
}

check() {
  cd "$srcdir/${_pkgbase}-$pkgver"
  make check
}

package() {
  cd "$srcdir/${_pkgbase}-$pkgver"
  make DESTDIR="$pkgdir/" install
  # sample config
  install -D -m644 "$srcdir"/${_pkgbase}-$pkgver/${_pkgbase}/opendmarc.conf.sample "$pkgdir"/etc/${_pkgbase}/opendmarc.conf.sample
  # license
  install -D -m644 "$srcdir"/${_pkgbase}-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  rm "$pkgdir"/usr/share/doc/${_pkgbase}/LICENSE
  # systemd service
  install -D -m644 "$srcdir/${_pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"
}
