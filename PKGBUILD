# Maintainer: Sean Greenslade <aur at seangreenslade dot com>
# Contributor: Jon Gjengset
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: andreas_baumann <abaumann at yahoo dot com>
# Contributor: tobias [tobias [at] archlinux.org]
# Contributor: Gaetan Bisson <bisson@archlinux.org>

_pkgbase=mutt
pkgname=${_pkgbase}-slang
pkgver=1.14.7
pkgrel=1
pkgdesc='Small but very powerful text-based mail client - slang version'
url='http://www.mutt.org/'
provides=('mutt')
conflicts=('mutt')
license=('GPL')
arch=('x86_64')
depends=('gdbm' 'glibc' 'libgpg-error' 'openssl' 'libsasl' 'mime-types' 'krb5' 'slang'
'sqlite' 'zlib')
makedepends=('gpgme' 'libidn2')
optdepends=('perl: for smime_keys'
            'smtp-forwarder: to send mail')
backup=('etc/Muttrc')
source=("https://bitbucket.org/mutt/mutt/downloads/${_pkgbase}-${pkgver}.tar.gz"{,.asc})
sha512sums=('dc9739b5f0a99ca70fcbd495c71fbead23e3481f9c9e426feb827997c9c42e5f28355084f54788820c96a079dedb649fcc20e69436fb3c4df7e46f372b533e7c'
            'SKIP')
b2sums=('f729412d3da97fe9bd76733705317660edfa3858a9eb1012179fb289b03da58d79b6e261dbdc4ab8b001e89ca455e9972bab8f270bac28e887afc7e0bd9fc8c1'
        'SKIP')
validpgpkeys=('8975A9B33AA37910385C5308ADEF768480316BDA') # Kevin J. McCarthy <kevin@8t8.us>

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
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
  depends+=('libgpgme.so' 'libidn2.so')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # /etc/mime.types is provided by mailcap
  rm "${pkgdir}"/etc/mime.types{,.dist}
  install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
