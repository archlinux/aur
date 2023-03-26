# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=2.2.10
pkgrel=1
pkgdesc="Small but very powerful text-based mail client - slang version"
arch=(x86_64)
url="http://www.mutt.org/"
license=(GPL2)
depends=(
  glibc
  libgpg-error
  mime-types
  slang
  sqlite
  zlib
)
makedepends=(
  docbook-xml
  docbook-xsl
  elinks
  gdbm
  gpgme
  krb5
  libidn2
  libsasl
  libxslt
  lynx
  openssl
)
provides=(mutt)
conflicts=(mutt)
optdepends=(
  'perl: for smime_keys'
  'python: for experimental mutt_oath2.py'
  'smtp-forwarder: to send mail'
)
backup=(etc/${_pkgbase}/Muttrc)
install=${_pkgbase}.install
source=(https://bitbucket.org/${_pkgbase}/${_pkgbase}/downloads/${_pkgbase}-$pkgver.tar.gz{,.asc})
sha512sums=('6db0009163b31425dafe7b6e38374a623f1fd057daf57baaebe18be6d42e5a0ce7087a41bc5e2411f4fbe144497a43682c480754b51108952c7dd16b9294192f'
            'SKIP')
b2sums=('d6892f49520b4fd73d7d0d04119b4f05828d76a4be4b55a8dbc585ef817d4455c9b9a93158d31e0699f011023de524355930d4acff3b9454982da0042c54db22'
        'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

prepare() {
  cd "${_pkgbase}-$pkgver"
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc/${_pkgbase}
    --enable-autocrypt
    --enable-compressed
    --enable-debug
    --enable-gpgme
    --enable-hcache
    --enable-imap
    --enable-pop
    --enable-sidebar
    --enable-smtp
    --with-slang=/usr
    --with-gss=/usr
    --with-idn2
    --with-sasl
    --with-sqlite3
    --with-ssl=/usr
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
  # we backup /etc/mutt/Muttrc and don't need another copy
  rm -v "$pkgdir/etc/${_pkgbase}/Muttrc.dist"
  # a more comprehensive list of mime types is provided by mailcap in /etc/mime.types
  rm -v "$pkgdir/etc/${_pkgbase}/mime.types"{,.dist}
  ln -sv ../mime.types "$pkgdir/etc/${_pkgbase}/mime.types"
}
