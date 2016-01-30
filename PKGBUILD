# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt-sidebar
pkgver=1.5.24
pkgrel=10
pkgdesc='Small but very powerful text-based mail client'
arch=('i686' 'x86_64' 'armv7h' 'armv7l')
url='http://www.mutt.org/'
license=('GPL')
depends=('gpgme' 'krb5' 'libidn' 'mime-types')
optdepends=('smtp-forwarder: to send mail')
conflicts=('mutt')
provides=('mutt')
source=("https://bitbucket.org/mutt/mutt/downloads/mutt-${pkgver}.tar.gz"
        "trash-folder.patch"
        "http://lunar-linux.org/~tchan/mutt/patch-1.5.24.sidebar.20151111.txt"
        "patch-for-first-char-jf.patch"
        "shortpath.patch")

prepare() {
  cd "$srcdir/mutt-$pkgver"

  # patch to add trash folder support
  # patch -Np1 -i "$srcdir"/trashfolder-1.5.22.diff0
  patch -Np1 -i "$srcdir"/trash-folder.patch

  # patch to add sidebar support
  patch -Np1 -i "$srcdir"/patch-1.5.24.sidebar.20151111.txt

  # patch for first char in mailboxdir
  patch -i "$srcdir"/patch-for-first-char-jf.patch

  # patch to fix shortpath
  patch -i "$srcdir"/shortpath.patch

  # fix automake issue
  autoreconf -vfi
}

build() {
  cd "$srcdir/mutt-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc \
              --enable-gpgme --enable-pop \
              --enable-imap --enable-smtp \
              --enable-hcache --with-curses=/usr \
              --with-regex --with-gss=/usr \
              --with-ssl=/usr --with-sasl \
              --with-idn
  make
}

package() {
  cd "$srcdir/mutt-$pkgver"
  make DESTDIR="$pkgdir" install

  # remove unneeded or conflicting files
  rm "$pkgdir"/etc/mime.types{,.dist}
  rm "$pkgdir"/usr/bin/{flea,muttbug}
  rm "$pkgdir"/usr/share/man/man1/{flea,muttbug}.1
}

sha512sums=('f7fe7edf9d1701a8e92761b1f5e6ef2e3a3b513af7898872cbe36a8800714cb76945788a60d2008820c57bc5344a4147e2686f690da42cfc8a912e3a432452b1'
            '13f2f6402d3bb407d5e0a04049f7be27c9dbc0ccb9681fe7640d060cc3c13d76a8cf9985da8daa680058603b317f9dbf1b2125aa9e103c625add0d8d530b2538'
            '2e622a34a1d101fe9370cc015b8253492d1649fcb593c6f9cbf6eb3b54119eaca836114dc4e3da83bc8fd9de434503c7d2295981a68dc05fd8e710925e2b1f77'
            '16ba918a8d5ef091cd7556e97189b43a0afdc1fc23a8bb9ece6a97281223090a5e680886233d2aa52e5340c402d19c68801b51eec13ae61cd8d301418470f11d'
            '9fe87a338090ac53856893f3392a6f94d5a855cff1338fb6d1a0ef8774e57b20e6a75212b43c266066fbaae7ff21978c8437aee2e601a20eaccadf6cb1425397')
