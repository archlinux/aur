# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Thomas Holmquist <thomas@vorget.com>
# Contributor: Jan Boehringer <ja(a)bm-boehringer.de>
# Contributor: Alex Griffin <griffin.aj(a)gmail.com>

pkgname=polipo
pkgver=1.1.1
pkgrel=4
pkgdesc="A small and fast caching web proxy."
arch=('x86_64')
url="http://www.pps.jussieu.fr/~jch/software/polipo/"
license=('GPL')
depends=('bash')
makedepends=('texinfo')
source=(http://www.pps.univ-paris-diderot.fr/~jch/software/files/polipo/polipo-$pkgver.tar.gz{,.asc}
        polipo.sysusers
        polipo.tmpfiles
        polipo.service)
validpgpkeys=('F8E70AAD74D32CAC27B9AFD62652C881EADB5526')
md5sums=('86939e331e656f638271f578b6e3f893'
         'SKIP'
         '3287e00f0e103a0e52c625efdabe5a37'
         '6cc953fb59920f4448d8cac53ac3fbc1'
         '3861a067f6cdd2b8afcee1de97678902')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make 	PREFIX="$pkgdir/usr" \
        MANDIR="$pkgdir/usr/share/man" \
        INFODIR="$pkgdir/usr/share/info" \
        LOCAL_ROOT="$pkgdir/usr/share/polipo/www" \
        DISK_CACHE_ROOT="$pkgdir/var/cache/polipo" \
        install

  # install config files
  install -Dm 644 config.sample "$pkgdir/etc/polipo/config.sample"
  install -Dm 644 forbidden.sample "$pkgdir/etc/polipo/forbidden.sample"

  # install license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/polipo/LICENSE"

  # install systemd service
  install -Dm 644 "$srcdir/polipo.service" "$pkgdir/usr/lib/systemd/system/polipo.service"

  # install system user
  install -Dm644 "$srcdir/polipo.sysusers" "$pkgdir/usr/lib/sysusers.d/polipo.conf"
  install -Dm644 "$srcdir/polipo.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/polipo.conf"
}

# vim:set ts=2 sw=2 et:
