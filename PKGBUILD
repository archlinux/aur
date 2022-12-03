# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=2.2.9
pkgrel=1
pkgdesc="Small but very powerful text-based mail client - slang version"
arch=(x86_64)
url="http://www.mutt.org/"
license=(GPL2)
depends=(glibc libgpg-error mime-types slang sqlite zlib)
makedepends=(docbook-xml docbook-xsl elinks gdbm gpgme krb5 libidn2 libsasl
libxslt lynx openssl)
provides=(mutt)
conflicts=(mutt)
optdepends=(
  'perl: for smime_keys'
  'python: for experimental mutt_oath2.py'
  'smtp-forwarder: to send mail'
)
backup=(etc/Muttrc)
options=(debug)
source=(https://bitbucket.org/${_pkgbase}/${_pkgbase}/downloads/${_pkgbase}-$pkgver.tar.gz{,.asc})
sha512sums=('d4d308ba573ba6e43b6dd2c131d0dc345163bd375f19a9038c9eeaf271f9da88043951f6c74658ff1a9d7a8fdcce28809aba50ab3f5aa0d34b77cf4989bc054f'
            'SKIP')
b2sums=('86b0743102bb1b023b3ccb03740c24c6ec728765b3770afdb3faed2982789aaa38a7c306e5ee30ca05ced1baa7771657ab37e5ad53eaf59ec73e51990f699c74'
        'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

prepare() {
  cd "${_pkgbase}-$pkgver"
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --enable-debug
    --enable-gpgme
    --enable-pop
    --enable-imap
    --enable-smtp
    --enable-hcache
    --enable-sidebar
    --enable-autocrypt
    --with-slang=/usr
    --with-gss=/usr
    --with-ssl=/usr
    --with-sqlite3
    --with-sasl
    --with-idn2
  )

  cd "${_pkgbase}-$pkgver"
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    gdbm libgdbm.so
    gpgme libgpgme.so
    krb5 libgssapi_krb5.so
    libidn2 libidn2.so
    libsasl libsasl2.so
    openssl libssl.so
  )

  make DESTDIR="$pkgdir" install -C ${_pkgbase}-$pkgver
  install -vDm 644 ${_pkgbase}-$pkgver/contrib/gpg.rc "$pkgdir/etc/Muttrc.gpg.dist"

  # /etc/mime.types is provided by mailcap
  rm "$pkgdir/etc/mime.types"{,.dist}
}
