# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: akojo
# Contributor: quizzlo
# Contributor: Kr1ss $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Maintainer: aksr <aksr at t-com dot me>
pkgname=tin
pkgver=2.6.2
pkgrel=1
pkgdesc='A threaded NNTP and spool based UseNet newsreader.'
arch=('i686' 'x86_64')
url='http://www.tin.org'
license=('BSD')
depends=('gsasl' 'icu' 'ncurses' 'perl')
makedepends=('dante' 'gnupg' 'ispell' 'libidn' 'pcre')
conflicts=('tin-unstable')
source=("ftp://ftp.tin.org/pub/news/clients/tin/v${pkgver%.*}/$pkgname-$pkgver.tar.gz" 'LICENSE')
md5sums=('6c815789ba41d74f16e60d131b78f9c1'
         'd11b33b8a9dd5c45c8ce290cf52fa764')
sha1sums=('c7939b0a60cd029070f7a7a44bd5065ff3594c35'
          '47b435e30e21815386db3123175d9a3bf9d63c76')
sha256sums=('81b8c07ed60e2c97d3677d78c21f320f8c97b84173b9a7a001fed742aaad1c70'
            'bf3c5eae73413ca2a64ef3a047ad3551a0613227b0aa99020b25cc96d9813f65')

build() {
	cd "$srcdir/$pkgname-$pkgver"
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
	--with-libdir=/usr/lib \
	--with-coffee \
	--with-socks \
	--with-socks5 \
	--disable-prototypes \
	--disable-echo
#	--with-domain-name         (default: unset)
#	--with-nntp-default-server (default: news.$DOMAIN_NAME)
#	--with-shell=PROG          (default: sh, except on BSD where csh is used)
#	--with-defaults-dir=PATH   (default: /etc/tin)
#	--with-editor=PROG         (default: empty)
#	--with-mailer=PROG         (default: empty)
#	--with-mailbox=PATH        (default: empty)
	make build
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	rm -f $pkgdir/usr/share/man/man5/{mbox.5,mmdf.5} # conflict with mutt package
	mv $pkgdir/usr/bin/url_handler.pl $pkgdir/usr/bin/tin_url_handler.pl
	install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	cd doc/
	install -D -m644 *.3 -t"$pkgdir/usr/share/man/man3/"
	install -D -m644 l10n/de/*.1 -t"$pkgdir/usr/share/man/de/man1/"
	install -D -m644 l10n/de/*.5 -t"$pkgdir/usr/share/man/de/man5/"
}
