pkgname=totd
pkgver=1.5.1
pkgrel=8
pkgdesc="Totd (Trick Or Treat Daemon) is DNS-proxy for IPv4/IPv6 translation (DNS-ALG)"
arch=('x86_64' 'i686')
url="https://github.com/fwdillema/totd"
license=('BSD')
groups=(network)
depends=('glibc')
optdepends=(socat)
backup=(etc/totd.conf)
install=totd.install
source=("http://mortzu.andromeda.hostedinspace.de/aur/$pkgname/$pkgname-$pkgver.tar.xz"
        Makefile.in.patch
        totd.conf
        totd.service
        totd.tmpfiles)
md5sums=('f9689c681f8accd39179a8323cc0a182'
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
