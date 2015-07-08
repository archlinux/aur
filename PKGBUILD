# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Tom Vincent <http://www.tlvince.com/contact/>

pkgname=mutt-kiss
pkgver=1.5.23
pkgrel=1
pkgdesc="Small but very powerful text-based mail client. Sans POP/IMAP/SMTP/SSL, with PGP/attachment patches."
arch=('i686' 'x86_64')
url="http://www.mutt.org/"
license=('GPL')
depends=('gpgme' 'libidn' 'ncurses')
provides=('mutt')
conflicts=('mutt')
backup=('etc/Muttrc')
install=$pkgname.install
source=("https://bitbucket.org/mutt/mutt/downloads/mutt-$pkgver.tar.gz"
        "simple-noconfig-proposal.patch"
        "mutt-attach.patch")
sha1sums=('8ac821d8b1e25504a31bf5fda9c08d93a4acc862'
          '1ca3a0ab5c4a965d180bd310ba15cfe42c6a4e12'
          '94da52d50508d8951aa78ca4b073023414866be1')

prepare() {
  cd "$srcdir/mutt-$pkgver"

  # Named PGP signature patch: http://dev.mutt.org/trac/ticket/3478
  patch -p1 -i ../simple-noconfig-proposal.patch

  # Forgotten attachment detector
  patch -p1 -i ../mutt-attach.patch
}

build() {
  cd "$srcdir/mutt-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gpgme \
    --enable-hcache \
    --with-curses=/usr \
    --with-regex \
    --with-idn \

  make
}

package() {
  cd "$srcdir/mutt-$pkgver"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir"/usr/bin/{flea,muttbug}
  rm "$pkgdir"/usr/share/man/man1/{flea,muttbug}.1
  rm "$pkgdir"/etc/mime.types{,.dist}
  install -Dm644 contrib/gpg.rc "$pkgdir/etc/Muttrc.gpg.dist"
}

# vim:set ts=2 sw=2 et:
