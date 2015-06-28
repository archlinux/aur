#Maintainer: aksr <aksr at t-com dot me>
pkgname=tin-unstable
_pkgname=tin
pkgver=2.3.1
pkgrel=1
pkgdesc="A threaded NNTP and spool based UseNet newsreader."
arch=('i686' 'x86_64')
url="http://www.tin.org"
license=('BSD')
depends=('ncurses' 'ispell' 'perl' 'gnupg' 'dante' 'icu' 'libidn')
conflicts=('tin')
source=("ftp://ftp.tin.org/pub/news/clients/tin/unstable/$_pkgname-$pkgver.tar.gz"
        'LICENSE')
md5sums=('32bb77201391052c3e54b15ecadc2963'
         '22de35b1bdc6f0df87c93ae794198b21')
sha1sums=('bee82da1e349a6a3954ab63d82a193e510aa1ff9'
          '07e1217ee68bb20f0ad2670e84116a0d67243063')
sha256sums=('d53ee03850988c96162f2a30a24f63a6976612f04fc049fd1e0c17d0d4567083'
            '5ccb431a94c2d2f093b8f93325075e5ad886772ba2a452478120b86ce71c0683')

build() {
  cd $srcdir/$_pkgname-$pkgver
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
#             --with-domain-name         (default: unset)
#             --with-nntp-default-server (default: news.$DOMAIN_NAME)
#             --with-shell=PROG          (default: sh, except on BSD where csh is used)
#             --with-defaults-dir=PATH   (default: /etc/tin)
#             --with-editor=PROG         (default: empty)
#             --with-mailer=PROG         (default: empty)
#             --with-mailbox=PATH        (default: empty)
  make build
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm -f $pkgdir/usr/share/man/man5/mbox.5
  rm -f $pkgdir/usr/share/man/man5/mmdf.5
  mv $pkgdir/usr/bin/url_handler.pl $pkgdir/usr/bin/tin_url_handler.pl
  install -Dm644 $srcdir/LICENSE  $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

