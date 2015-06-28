# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: akojo
# Contributor: quizzlo
# Maintainer: aksr <aksr at t-com dot me>
pkgname=tin
pkgver=2.2.1
pkgrel=1
pkgdesc="A threaded NNTP and spool based UseNet newsreader."
arch=('i686' 'x86_64')
url="http://www.tin.org"
license=('BSD')
depends=('ncurses' 'ispell' 'perl' 'gnupg' 'dante' 'icu' 'libidn')
conflicts=('tin-unstable')
source=("ftp://ftp.tin.org/pub/news/clients/tin/stable/$pkgname-$pkgver.tar.gz"
        'LICENSE')
md5sums=('31ca384c33b5d7b58065cfa0a5b23a35'
         '22de35b1bdc6f0df87c93ae794198b21')
sha1sums=('9ef12345ed1cfb482138c5c54a7f73dfb91b9039'
          '07e1217ee68bb20f0ad2670e84116a0d67243063')
sha256sums=('cf588884bbe4711498b807311e53d82a1b6ca343f4c85e53001c90e8c0e456ac'
            '5ccb431a94c2d2f093b8f93325075e5ad886772ba2a452478120b86ce71c0683')

build() {
  cd $srcdir/$pkgname-$pkgver
  unset CFLAGS
  unset CPPFLAGS
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --enable-shell-escape \
    --enable-nntp \
    --enable-nls \
    --enable-ipv6 \
    --enable-append-pid \
    --enable-posting \
    --enable-piping \
    --enable-locale \
    --enable-xhdr-xref \
    --with-spool-dir=/var/spool/news \
    --with-ispell=/usr/bin/ispell \
    --with-gpg=/usr/bin/gpg \
    --with-pcre=/usr \
    --with-screen=ncursesw \
    --with-inews-dir=/usr/lib/news \
    --with-libdir=/usr/lib/news \
    --with-coffee \
    --with-socks \
    --with-socks5 \
    --disable-prototypes \
    --disable-echo
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
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm -f $pkgdir/usr/share/man/man5/mbox.5
  rm -f $pkgdir/usr/share/man/man5/mmdf.5
  mv $pkgdir/usr/bin/url_handler.pl $pkgdir/usr/bin/tin_url_handler.pl
  install -D -m644 $srcdir/LICENSE  $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

