# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: tobias [tobias [at] archlinux.org]

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=2.2.8
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
sha512sums=('7723dffd5fb0f6f1aa1ab22e90f101d0d8b9cd4f198a3ac7ebbba7a3c00e0f2163ce03075f48a6f288a81bf621204c8d8eb247a3fb216a5f7d37686b0e8b9fb2'
            'SKIP')
b2sums=('cdbb2ba8971a6f9cf6f5ee8f1e666e835d1716957d001561c67fab6381041ce5f8c994dad6e2d83f76e47f1ea12033d55b2c5f61348369c740f224d80405c0e1'
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
