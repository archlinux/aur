pkgname=mutt-sidebar
_pkgname=mutt
pkgver=1.6.1
pkgrel=5
pkgdesc='Small but very powerful text-based mail client with sidebar and trash patches from NeoMutt'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64')
conflicts=('mutt')
provides=('mutt')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
source=("http://ftp.mutt.org/pub/mutt/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        "sidebar.patch"
        "trash.patch")
sha1sums=('ff1c76209a5c299018fc72b9e2e1ab98bf5138dd'
          'SKIP'
          '4d192a7c60c9d7d54ca1a6dac11ba28d08a07a36'
          '0f598412830d1e3594fd4fd000196d667dee3e19')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/trash.patch"
  patch -Np1 -i "${srcdir}/sidebar.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-gpgme \
      --enable-pop \
      --enable-imap \
      --enable-smtp \
      --enable-hcache \
      --with-curses=/usr \
      --with-regex \
      --with-gss=/usr \
      --with-ssl=/usr \
      --with-sasl \
      --with-idn \
      --enable-sidebar \

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm "${pkgdir}"/etc/mime.types{,.dist}
  rm "${pkgdir}"/usr/bin/{flea,muttbug}
  rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
  install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
