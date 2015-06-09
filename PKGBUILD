# Maintainer: Alessio Sergi <asergi at archlinux dot us>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=mutt-sidebar
pkgver=1.5.23
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
        "ftp://ftp.openbsd.org/pub/OpenBSD/distfiles/mutt/trashfolder-1.5.22.diff0.gz"
        "patch-1.5.23.sidebar.20140412.txt"
        "patch-for-first-char-jf.patch"
        "shortpath.patch")

sha512sums=('f1b4a7230253651857f61bd7215cce870a613012f613d4c907d401556083726c8ed7d429d57a8bf858c3b5b23683380d4c1494540d86ca80813e22cb6b95bc1e'
            'a00075888c12ce55e5173788d9e0397f4cc65f8344328112342399b9734f041e80cceaee18ce68fe79471457e72b743b08112bf4f71d251db25f45ed5ee27ada'
            'ac023f1ba5843a010de497b9cd85b22af6a30ceb8622c01be3c5b7e8e0761d8efe8e86e8c9b11aa96dcc405e8b1657672ec6da111b703d562bddf35ba848d34d'
            '16ba918a8d5ef091cd7556e97189b43a0afdc1fc23a8bb9ece6a97281223090a5e680886233d2aa52e5340c402d19c68801b51eec13ae61cd8d301418470f11d'
            '9fe87a338090ac53856893f3392a6f94d5a855cff1338fb6d1a0ef8774e57b20e6a75212b43c266066fbaae7ff21978c8437aee2e601a20eaccadf6cb1425397')

prepare() {
  cd "$srcdir/mutt-$pkgver"

  # patch to add trash folder support
  patch -Np1 -i "$srcdir"/trashfolder-1.5.22.diff0

  # patch to add sidebar support
  patch -Np1 -i "$srcdir"/patch-1.5.23.sidebar.20140412.txt

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

  # install Muttrc.gpg file
  install -D -m 644 contrib/gpg.rc "$pkgdir"/etc/Muttrc.gpg.dist
}
