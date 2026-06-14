# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=2.3.3
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
  git
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
source=("git+https://gitlab.com/muttmua/mutt.git#tag=mutt-${pkgver//./-}-rel?signed")
sha512sums=('690103869fe9c89b192b160eb64fc4eb6133539fcabfa83a69b6206ed261a6f0ae058bfda46958aa5aa60a364411d571e1c33fad4e00cf9f888c09f31ff86ae2')
b2sums=('3b6dd82b4eb1cdf1bc944899c2c1ee801a80d8ef915108defa6fdb0669acb478f9905659bfe6a58243e2298328c7db046979bc61a055cc8ef725cbb1fd1f7a9f')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

prepare() {
  cd "${_pkgbase}"
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
    --with-gdbm
    --with-gss=/usr
    --with-idn2
    --with-sasl
    --with-sqlite3
    --with-ssl=/usr
  )

  cd "${_pkgbase}"
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

  make DESTDIR="$pkgdir" install -C ${_pkgbase}
  # we backup /etc/mutt/Muttrc and don't need another copy
  rm -v "$pkgdir/etc/${_pkgbase}/Muttrc.dist"
  # a more comprehensive list of mime types is provided by mailcap in /etc/mime.types
  rm -v "$pkgdir/etc/${_pkgbase}/mime.types"{,.dist}
  ln -sv ../mime.types "$pkgdir/etc/${_pkgbase}/mime.types"
}
