# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: v01d <phreakuencies@gmail.com>

pkgname=p3scan
pkgver=2.3.2
pkgrel=12
pkgdesc="Fully transparent POP3/SMTP proxy with Anti-Virus and SPAM protection"
arch=('x86_64')
url="http://p3scan.sourceforge.net/"
depends=('pcre' 'openssl')
license=('GPL')
install=p3scan.install
validpgpkeys=('B312DD49453C18B45332D3D6F7F54A759AE7BF76')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc}
	"p3scan.service"
	"p3scan.tmpfiles")
sha256sums=('570bdf87132b23120339e247809dc2cf37c2735d504f4e1072528c04d940bb5f'
            'SKIP'
            '0a38655a2f944588529fdb5f47542f6e09c067a615f947cbedabced96d748190'
            'aad248721cb3eb587795bf2e849e3076b6899ad8ecba27b19f69e12d2481a81a')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # Fix CFLAGS and other options hardcoded in Makefiles
  unset CFLAGS
  sed -ri "s|^CFLAGS=-Wall( -g)? -O2|CFLAGS=-Wall $CFLAGS|" Makefile ripmime/Makefile ripmime/tnef/Makefile ripmime/ripOLE/Makefile
  sed -ri 's|^LOCATION=.+$|LOCATION=/usr|' ripmime/Makefile
  sed -ri 's|\$\(SYSINS\) -v -m 550 --strip p3scan \$\(PREFIX\)/sbin/|$(SYSINS) -D -v -m 550 --strip p3scan $(DESTDIR)/usr/bin/|' Makefile
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  # Create base dirs, the Makefile assumes they're there
  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man8 "$pkgdir"/etc/rc.d

  # install with root set on "$pkgdir"
  make DESTDIR="$pkgdir" install MANDIR=/usr/share/man/man8

  # delete init script provided
  rm -rf "$pkgdir"/etc/rc.d

  # BUG?: make absolute link a relative one
  (
    cd "$pkgdir"/etc/p3scan
    ln -sf p3scan-en.mail p3scan.mail
  )

  # BUG: fix .conf file (the license has C style comments, they should be conf-style comments)
  sed -ri 's|^[/ ]\*/?|# |g' "$pkgdir"/etc/p3scan/p3scan.conf

  mv "$pkgdir"/usr/doc "$pkgdir"/usr/share/
  rm -rf "$pkgdir"/var/run

  install -Dm0644 "$srcdir"/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
  install -Dm0644 "$srcdir"/$pkgname.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/$pkgname.conf
}
