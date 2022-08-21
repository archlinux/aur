# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=2.2.7
pkgrel=1
pkgdesc="Small but very powerful text-based mail client - slang version"
arch=(x86_64)
url="http://www.mutt.org/"
license=(GPL2)
depends=(glibc libgpg-error openssl libsasl mime-types slang sqlite zlib)
makedepends=(docbook-xml docbook-xsl elinks gdbm gpgme krb5 libidn2 libxslt
lynx ncurses)
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
sha512sums=('5bc88d3efe82db50c2756e7011831caf907adf794e4d693d1318d25deeabac6834989ddef074064252f0f1f0e7df30d6d7d895e0a1d7893696e1f5252955ba22'
            'SKIP')
b2sums=('3cc02ec5bc46f6a3f34c87c1454bdb0198be75a5669896b72ccd780b582cb1e7a4de466c41d25d1e74ab34e177bdca8c05574eddc6302e05acb8e3be6f53438e'
        'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

prepare() {
  cd "${_pkgbase}-$pkgver"
  autoreconf -fiv
}

build() {
  cd "${_pkgbase}-$pkgver"
  ./configure \
    --prefix=/usr \
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
  depends+=(libgdbm.so libgpgme.so libgssapi_krb5.so libidn2.so)

  make DESTDIR="$pkgdir" install -C ${_pkgbase}-$pkgver
  install -vDm 644 ${_pkgbase}-$pkgver/contrib/gpg.rc "$pkgdir/etc/Muttrc.gpg.dist"

  # /etc/mime.types is provided by mailcap
  rm "$pkgdir/etc/mime.types"{,.dist}
}
