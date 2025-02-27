# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: akojo
# Contributor: quizzlo
# Contributor: Kr1ss $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Maintainer: aksr <aksr at t-com dot me>
pkgname=tin
pkgver=2.6.4
pkgrel=1
pkgdesc='A threaded NNTP and spool based UseNet newsreader.'
arch=('i686' 'x86_64')
url='http://www.tin.org'
license=('BSD')
depends=('gsasl' 'icu' 'ncurses' 'pcre' 'perl')
makedepends=('dante' 'gnupg' 'ispell' 'libidn')
conflicts=('tin-unstable')
source=("ftp://ftp.tin.org/pub/news/clients/tin/v${pkgver%.*}/$pkgname-$pkgver.tar.gz" 'LICENSE')
md5sums=('a70b44f473844a0b82a3a436b900bb39'
         'd11b33b8a9dd5c45c8ce290cf52fa764')
sha1sums=('141be5d58937f2639e39498a53aa9fde4de6f2a8'
          '47b435e30e21815386db3123175d9a3bf9d63c76')
sha256sums=('525ade9e66aecfa0a9883d35f2cf4cdcc8e24b979e97623b10cea58d63f64b78'
            'bf3c5eae73413ca2a64ef3a047ad3551a0613227b0aa99020b25cc96d9813f65')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	unset CFLAGS
	unset CPPFLAGS
	./configure CFLAGS='-fpermissive' \
	--prefix=/usr --mandir=/usr/share/man \
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
