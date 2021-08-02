# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=2.1.1
pkgrel=1
pkgdesc="Small but very powerful text-based mail client - slang version"
url="http://www.mutt.org/"
license=('GPL2')
arch=('x86_64')
provides=('mutt')
conflicts=('mutt')
depends=('gdbm' 'glibc' 'libgpg-error' 'openssl' 'libsasl' 'mime-types' 'slang'
'sqlite' 'zlib')
makedepends=('docbook-xml' 'docbook-xsl' 'elinks' 'git' 'gpgme' 'krb5'
'libidn2' 'lynx' 'libxslt')
optdepends=('perl: for smime_keys'
            'python: for experimental mutt_oath2.py'
            'smtp-forwarder: to send mail')
backup=('etc/Muttrc')
source=("git+https://gitlab.com/muttmua/${_pkgbase}.git#tag=${_pkgbase}-${pkgver//./-}-rel?signed")
sha512sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

prepare() {
  cd "${_pkgbase}"
  autoreconf -vfi
}

build() {
  cd "${_pkgbase}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --enable-debug \
              --enable-gpgme \
              --enable-pop \
              --enable-imap \
              --enable-smtp \
              --enable-hcache \
              --enable-sidebar \
              --enable-autocrypt \
              --with-slang=/usr \
              --with-gss=/usr \
              --with-ssl=/usr \
              --with-sqlite3 \
              --with-sasl \
              --with-idn2
  make
}

package() {
  depends+=('libgpgme.so' 'libgssapi_krb5.so' 'libidn2.so')

  cd "${_pkgbase}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 contrib/gpg.rc "${pkgdir}/etc/Muttrc.gpg.dist"

  # /etc/mime.types is provided by mailcap
  rm "${pkgdir}"/etc/mime.types{,.dist}
}
