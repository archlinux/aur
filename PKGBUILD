# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : aksr <aksr at t-com dot me>
# Contributor : dorphell <dorphell@archlinux.org>
# Contributor : akojo
# Contributor : quizzlo


pkgname=tin

pkgver=2.6.1
pkgrel=1

pkgdesc='Threaded NNTP and spool based UseNet newsreader'
arch=('i686' 'x86_64')
url="http://www.$pkgname.org"
license=('BSD')

depends=('ncurses' 'ispell' 'perl' 'gnupg' 'dante' 'icu' 'libidn' 'gsasl')

changelog=CHANGES
source=("ftp://ftp.$pkgname.org/pub/news/clients/$pkgname/v${pkgver%.*}/$pkgname-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('6b1bc8c8ab07467bc8dbc845a1c7389339e1beb0244894d7911457efd25a83b5'
            '5ccb431a94c2d2f093b8f93325075e5ad886772ba2a452478120b86ce71c0683')

options=('zipman')


build() {
  cd "$pkgname-$pkgver"
  unset CFLAGS CPPFLAGS
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-shell-escape --enable-nntp --enable-nls \
    --enable-ipv6 --enable-append-pid --enable-posting --enable-piping --enable-locale \
    --enable-xhdr-xref --with-spool-dir=/var/spool/news --with-ispell=/usr/bin/ispell \
    --with-pcre=/usr --with-gpg=/usr/bin/gpg --with-screen=ncursesw \
    --with-coffee --with-socks --with-socks5 --disable-prototypes --disable-echo \
    --with-inews-dir=/var/lib/news --with-libdir=/var/lib/news
#   --with-domain-name         (default: unset)
#   --with-nntp-default-server (default: news.$DOMAIN_NAME)
#   --with-shell=PROG          (default: sh, except on BSD where csh is used)
#   --with-defaults-dir=PATH   (default: /etc/tin)
#   --with-editor=PROG         (default: empty)
#   --with-mailer=PROG         (default: empty)
#   --with-mailbox=PATH        (default: empty)
  make build
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm755 {tools/,"$pkgdir/usr/bin/$pkgname"_}url_handler.sh
  install -Dm644 README      -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 ../LICENSE  -t"$pkgdir/usr/share/licenses/$pkgname/"
  cd doc
  install -Dm644 *.3         -t"$pkgdir/usr/share/man/man3/"
  install -Dm644 l10n/es/*.1 -t"$pkgdir/usr/share/man/es/man1/"
  install -Dm644 l10n/es/*.5 -t"$pkgdir/usr/share/man/es/man5/"
  install -Dm644 l10n/de/*.1 -t"$pkgdir/usr/share/man/de/man1/"
  install -Dm644 l10n/de/*.5 -t"$pkgdir/usr/share/man/de/man5/"
  ln -s {,"$pkgdir/usr/bin/$pkgname"_}url_handler.pl
  rm "$pkgdir/usr/share/man/man5"/m{box,mdf}.5  # conflicts with the `mutt` package
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
