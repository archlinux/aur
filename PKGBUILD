# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=ccze
pkgver=0.2.1
pkgrel=13
pkgdesc="Robust and modular log colorizer with many plugins"
arch=('x86_64')
url="http://freshmeat.net/projects/ccze/"
license=('GPL')
depends=('ncurses' 'pcre')
makedepends=('patch')
backup=('etc/cczerc')
source=(https://deb.debian.org/debian/pool/main/c/$pkgname/${pkgname}_${pkgver}.orig.tar.gz \
        $pkgname-fix-segfault.diff)
sha512sums=('1704da8d4c97a3403a57d7841db8a6e4ba6116e401f91d9ecf1b1371cc18b40641e5665c9414740d6a523874be6b6527f5c0d4f3a3796c7b96ed83192146b2b7'
            'aa67066a1b597e12509c19286fda8427dedcc75fa94fe32817cbec2bfb8bf3cfb420f7344faf7fb4847feb13c2a2e5aca85e73109e7c0893e26028b7713c0ddf')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -Np0 -i "${srcdir}"/$pkgname-fix-segfault.diff

  #killing a bug
  sed -e 's/-Wswitch -Wmulticharacter/-Wswitch/' -i src/Makefile.in
  sed -e '/#undef error_t/d' -i system.h.in

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

# FS#71267 - add ccze-dump
   install -Dm755 -t "${pkgdir}"/usr/bin src/ccze-dump

  "${pkgdir}"/usr/bin/ccze-dump > "${srcdir}"/cczerc
  install -Dm644 -t "${pkgdir}"/etc "${srcdir}"/cczerc
}
