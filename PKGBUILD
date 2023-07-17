# Maintainer: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=dma
pkgver=0.13
pkgrel=2
pkgdesc="DragonFly BSD mail transport agent"
url="https://github.com/corecode/dma"
arch=('x86_64')
license=('BSD')
makedepends=('ed' 'systemd')
depends=('glibc' 'openssl')
provides=('smtp-forwarder')
conflicts=('smtp-forwarder')
backup=('etc/dma/auth.conf' 'etc/dma/dma.conf')
options=('emptydirs')
source=(dma-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=('9d4b903f2b750d888f51d668d08d2ea18404dedb0a52cffeb3c81376023c1946')

_buildargs="PREFIX=/usr LIBEXEC=/usr/lib/dma SBIN=/usr/bin"

build() {
  cd dma-$pkgver
  make $_buildargs
}

package() {
  cd dma-$pkgver
  make install sendmail-link mailq-link install-etc DESTDIR="$pkgdir" $_buildargs

  install -d -o root -g mail -m 2775 "$pkgdir/var/spool/dma"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
