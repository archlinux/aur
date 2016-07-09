pkgname=mutt-sidebar
_pkgname=mutt
pkgver=1.6.2
pkgrel=2
pkgdesc='Small but very powerful text-based mail client with sidebar and trash patches from NeoMutt'
url='http://www.mutt.org/'
license=('GPL')
backup=('etc/Muttrc')
arch=('i686' 'x86_64' 'armv6h')
conflicts=('mutt')
provides=('mutt')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types' 'krb5')
source=("http://ftp.mutt.org/pub/mutt/${_pkgname}-${pkgver}.tar.gz"{,.asc}
        "sidebar.patch"
        "trash.patch")
sha1sums=('67910ea4025a7f5ac8808e34bd55519200e08bcf'
          'SKIP'
          '20c25d7c3eff39ddd8ce1f71756f54eb2bc0cbdc'
          'ef61067464aad4c4f3737eb2247389a5b48bb0df')
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
