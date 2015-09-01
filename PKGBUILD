# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Patrick Brisbin <pbrisbin@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=muddy-mutt
pkgver=1.5.24
pkgrel=1
pkgdesc="Small but very powerful text-based mail client, muddied with potentially useful patches."
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
optdepends=('smtp-forwarder: to send mail')
depends=('openssl' 'gdbm' 'mime-types' 'libsasl' 'gnupg' 'gpgme' 'libidn' 'krb5' 'slang')
conflicts=('mutt')
provides=('mutt')
source=(https://bitbucket.org/mutt/mutt/downloads/mutt-${pkgver}.tar.gz
        sidebar.patch
        sidebar-drawing-fix.patch
        trash_folder-1.5.18.patch
        muttrc.example
        mutt-unmailbox.patch
        mutt-attach.patch
        sidebar-dotted.patch
        sidebar-utf8.patch
        collapse-flagged.patch)

sha256sums=('a292ca765ed7b19db4ac495938a3ef808a16193b7d623d65562bb8feb2b42200'
            '911299be0946de717a39a0712bb555c5a4666497bb5d8490c79bb50d8c8b14ee'
            '70dcc2870607838afc968e9b69e3c4f97a5770a8f2742ecb0316b877b88e6f5b'
            '36899ed9442f9988f2ae3438a3c561cd3e6944ad0115296de24e968e6fd245ef'
            '608423900a7ce6fc39a1da73d35825e9c456adfe535cb586926a53e314958942'
            '88f44f9bf90e28c3b08791bdcc63ec000439724726914e01b288b3a1bd19c22a'
            'da2c9e54a5426019b84837faef18cc51e174108f07dc7ec15968ca732880cb14'
            '1a0fd6663173725f55c2251c595d99d6614d84440d1f871bd9165749450a0e77'
            '91161f28d181af2fd7bb521b0b066d1666befc2decc3d77acec304ce9aa82c6d'
            '458585fd7d2145e0f5a37132279e09f8bcb180e227fe02d8864f27fc03f4636b')

build() {
  cd "$srcdir/mutt-$pkgver"

  # forgotten attatchment detector
  patch -p1 < "$srcdir/mutt-attach.patch"

  # patch to add sidebar support
  patch -p1 < "$srcdir/sidebar.patch"
  patch -p1 < "$srcdir/sidebar-drawing-fix.patch"
  patch -p1 < "$srcdir/sidebar-dotted.patch"
  patch -p1 < "$srcdir/sidebar-utf8.patch"

  # patch to add trash folder
  patch -p1 < "$srcdir/trash_folder-1.5.18.patch"

  # patch to not collapse threads with flagged messages
  patch -p1 < "$srcdir/collapse-flagged.patch"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gpgme \
    --enable-pop \
    --enable-imap \
    --enable-smtp \
    --enable-hcache \
    --with-regex \
    --with-gss=/usr \
    --with-ssl=/usr \
    --with-sasl \
    --with-idn \
    --with-slang \
    #--with-curses=/usr \
  make
}

package() {
  cd "$srcdir/mutt-$pkgver"

  make DESTDIR="$pkgdir" install

  # remove unneeded or conflicting files
  rm "${pkgdir}"/usr/bin/{flea,muttbug}
  rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
  rm "${pkgdir}"/etc/mime.types{,.dist}
  install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
