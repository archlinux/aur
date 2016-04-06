# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: boyska <piuttosto@logorroici.org>

_pkgname=neomutt
pkgname=neomutt
pkgver=neomutt.20160404.r0.gfba0ecd
pkgrel=1
pkgdesc='Small but powerful text-based mail client'
url='https://github.com/neomutt/neomutt'
license=('GPL')
source=('git+https://github.com/neomutt/neomutt.git#branch=neomutt')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('openssl' 'gdbm' 'mime-types' 'libsasl' 'gnupg' 'gpgme' 'libidn' 'krb5')
makedepends=('git' 'gnupg' 'libxslt')
conflicts=('mutt')
provides=('mutt')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  # Configure the build.
 ./prepare \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-debug \
    --enable-pgp \
    --enable-gpgme \
    --enable-notmuch \
    --enable-pop \
    --enable-imap \
    --enable-smtp \
    --enable-hcache \
    --enable-sidebar \
    --with-gss=/usr \
    --with-ssl=/usr \
    --with-sasl \
    --with-curses=/usr \
    --with-regex \
    --with-idn

  # Build it!
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  make DESTDIR="${pkgdir}" install

  # Cruft we don't want.
  rm "${pkgdir}"/usr/bin/{flea,muttbug}
  rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
  rm "${pkgdir}"/etc/mime.types{,.dist}
}

# vim: ft=sh ts=2 sw=2 et
