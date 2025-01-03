# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=dma
pkgver=0.14
pkgrel=1
pkgdesc="DragonFly BSD mail transport agent"
url="https://github.com/corecode/dma"
arch=('x86_64')
license=('BSD')
makedepends=('ed' 'git' 'systemd')
depends=('glibc' 'openssl')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
backup=('etc/dma/auth.conf' 'etc/dma/dma.conf')
options=('emptydirs')
source=("git+https://github.com/corecode/dma.git#tag=v${pkgver}")
sha256sums=('82789c2c161c3ba016f62008bfdfe2cd591f88dd4c2797d2684c1582bb3c085b')

build() {
  cd dma
  make PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin
}

package() {
  cd dma
  make install sendmail-link mailq-link install-etc DESTDIR="$pkgdir" \
  PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin

  install -d -o root -g mail -m 2775 "$pkgdir/var/spool/dma"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
