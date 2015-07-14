# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Loui Chang <louipc dot ist at NOSPAM gmail dot com>

pkgname=mutt-kz
pkgver=1.5.23.1
pkgrel=1
pkgdesc="Mutt with notmuch support and another improvements."
url="https://github.com/karelzak/mutt-kz"
arch=(i686 x86_64)
license=('GPL')
depends=('libidn' 'krb5' 'notmuch-runtime')
makedepends=('git' 'gnupg' 'libxslt')
conflicts=('mutt')
provides=('mutt')
options=('!strip')
source=("https://github.com/karelzak/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('808c7a47e5d6f16d4bbb631e550d9b4b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ././prepare
  ./configure --enable-notmuch \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gpgme \
    --enable-pop \
    --enable-imap \
    --enable-smtp \
    --enable-pgp \
    --enable-hcache \
    --with-curses=/usr \
    --with-regex \
    --with-gss=/usr \
    --with-ssl=/usr \
    --with-sasl \
    --with-idn

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  rm "${pkgdir}"/usr/bin/{flea,muttbug}
  rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
  rm "${pkgdir}"/etc/mime.types{,.dist}
  install -Dm644 contrib/gpg.rc "${pkgdir}/etc/Muttrc.gpg.dist"
}
