pkgname=totd
pkgver=1.5.1
pkgrel=7
pkgdesc="Totd (Trick Or Treat Daemon) is DNS-proxy for IPv4/IPv6 translation (DNS-ALG)"
arch=('x86_64' 'i686')
url="http://www.dillema.net/software/totd.html"
license=('BSD')
groups=(network)
depends=('glibc')
optdepends=(socat)
backup=(etc/totd.conf)
install=totd.install
source=("http://www.dillema.net/software/$pkgname/$pkgname-$pkgver.tar.gz"
        Makefile.in.patch
        totd.conf
        totd.service
        totd.tmpfiles)
md5sums=('7edaedae9f6aca5912dd6c123582cf08'
         'd2700ca1d451747d937fd3c1a3cf465f'
         'ff07c559419f8b7ee05351182a140483'
         '0ac3d9982a2c79842778bdb5fa60435f'
         '07b927909c9c440f15552ddf1a5ff56e')

build() {
  cd "$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/Makefile.in.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin

  make
}

package() {
  cd "$pkgname-$pkgver"

  # prepare directories
  mkdir -p ${pkgdir}/usr/{bin,man/man8}

  # build program
  make DESTDIR="$pkgdir" install

  # install default config
  install -Dm664 "$srcdir/totd.conf" "$pkgdir/etc/totd.conf"

  # systemd
  install -Dm644 "$srcdir/totd.service" "$pkgdir/usr/lib/systemd/system/totd.service"
  install -Dm644 "$srcdir/totd.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/totd.conf"
}
# vim:set ts=2 sw=2 et:
